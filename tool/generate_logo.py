#!/usr/bin/env python3
"""Generate Filful brand logo assets (pure Python, no external deps).

Outputs:
  assets/logo/app_icon.png   1024x1024 opaque icon (full-bleed brand blue square)
  assets/logo/splash_logo.png  1024x1024 transparent (logo mark centered)
"""

import math
import os
import struct
import zlib

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT_DIR = os.path.join(ROOT, "assets", "logo")

# Brand palette
BLUE_TOP = (0x2E, 0x6B, 0xB8)
BLUE_BOTTOM = (0x14, 0x3C, 0x72)
WHITE = (255, 255, 255)
GREEN = (0x2F, 0xC8, 0x6E)


def clamp(v, lo, hi):
    return lo if v < lo else (hi if v > hi else v)


def new_canvas(w, h, bg=None):
    buf = bytearray(w * h * 4)
    if bg is not None:
        r, g, b, a = bg
        for i in range(0, len(buf), 4):
            buf[i] = r
            buf[i + 1] = g
            buf[i + 2] = b
            buf[i + 3] = a
    return buf


def fill_gradient(buf, w, h, top, bottom):
    tr, tg, tb = top
    br, bg_, bb = bottom
    for y in range(h):
        t = y / (h - 1) if h > 1 else 0.0
        r = int(round(tr + (br - tr) * t))
        g = int(round(tg + (bg_ - tg) * t))
        b = int(round(tb + (bb - tb) * t))
        row = y * w * 4
        for x in range(w):
            i = row + x * 4
            buf[i] = r
            buf[i + 1] = g
            buf[i + 2] = b
            buf[i + 3] = 255
    return buf


def blend_px(buf, w, x, y, r, g, b, a):
    if x < 0 or y < 0 or x >= w or y >= w:
        return
    i = (y * w + x) * 4
    dst_a = buf[i + 3] / 255.0
    src_a = a / 255.0
    out_a = src_a + dst_a * (1.0 - src_a)
    if out_a <= 0.0:
        return
    buf[i] = int(round((r * src_a + buf[i] * dst_a * (1.0 - src_a)) / out_a))
    buf[i + 1] = int(round((g * src_a + buf[i + 1] * dst_a * (1.0 - src_a)) / out_a))
    buf[i + 2] = int(round((b * src_a + buf[i + 2] * dst_a * (1.0 - src_a)) / out_a))
    buf[i + 3] = int(round(out_a * 255.0))


def draw_sdf(buf, w, x0, y0, x1, y1, color, sd, aa=1.2):
    if len(color) == 3:
        r, g, b = color
        a = 255
    else:
        r, g, b, a = color
    x0 = max(0, x0)
    y0 = max(0, y0)
    x1 = min(w, x1)
    y1 = min(w, y1)
    for y in range(y0, y1):
        for x in range(x0, x1):
            d = sd(x + 0.5, y + 0.5)
            cov = clamp(0.5 - d / aa, 0.0, 1.0)
            if cov > 0.0:
                blend_px(buf, w, x, y, r, g, b, int(round(cov * a)))


def sd_round_rect(px, py, cx, cy, hw, hh, r):
    qx = abs(px - cx) - (hw - r)
    qy = abs(py - cy) - (hh - r)
    ax = qx if qx > 0 else 0.0
    ay = qy if qy > 0 else 0.0
    return math.hypot(ax, ay) + min(max(qx, qy), 0.0) - r


def sd_segment(px, py, ax, ay, bx, by):
    pax = px - ax
    pay = py - ay
    bax = bx - ax
    bay = by - ay
    denom = bax * bax + bay * bay
    h = clamp((pax * bax + pay * bay) / denom, 0.0, 1.0) if denom else 0.0
    dx = pax - bax * h
    dy = pay - bay * h
    return math.hypot(dx, dy)


def fill_round_rect(buf, w, cx, cy, hw, hh, r, color, aa=1.2):
    x0 = int(cx - hw - aa - 1)
    x1 = int(cx + hw + aa + 2)
    y0 = int(cy - hh - aa - 1)
    y1 = int(cy + hh + aa + 2)
    draw_sdf(buf, w, x0, y0, x1, y1, color,
             lambda px, py: sd_round_rect(px, py, cx, cy, hw, hh, r), aa)


def draw_capsule(buf, w, ax, ay, bx, by, half_w, color, aa=1.2):
    x0 = int(min(ax, bx) - half_w - aa - 1)
    x1 = int(max(ax, bx) + half_w + aa + 2)
    y0 = int(min(ay, by) - half_w - aa - 1)
    y1 = int(max(ay, by) + half_w + aa + 2)
    draw_sdf(buf, w, x0, y0, x1, y1, color,
             lambda px, py: sd_segment(px, py, ax, ay, bx, by) - half_w, aa)


def fill_circle(buf, w, cx, cy, r, color, aa=1.2):
    x0 = int(cx - r - aa - 1)
    x1 = int(cx + r + aa + 2)
    y0 = int(cy - r - aa - 1)
    y1 = int(cy + r + aa + 2)
    draw_sdf(buf, w, x0, y0, x1, y1, color,
             lambda px, py: math.hypot(px - cx, py - cy) - r, aa)


def draw_letter_f(buf, w, cx, cy, fw, fh):
    sw = fw * 0.30
    rad = sw / 2.0
    left = cx - fw / 2.0
    top = cy - fh / 2.0
    stem_x = left + sw / 2.0
    # stem
    fill_round_rect(buf, w, stem_x, cy, sw / 2.0, fh / 2.0, rad, WHITE)
    # top arm
    top_arm_w = fw
    fill_round_rect(buf, w, left + top_arm_w / 2.0, top + sw / 2.0,
                    top_arm_w / 2.0, sw / 2.0, rad, WHITE)
    # mid arm (slightly shorter)
    mid_arm_w = fw * 0.82
    mid_y = top + fh * 0.46
    fill_round_rect(buf, w, left + mid_arm_w / 2.0, mid_y,
                    mid_arm_w / 2.0, sw / 2.0, rad, WHITE)


def draw_check(buf, w, cx, cy, size):
    hw = size * 0.14
    # two capsule strokes
    ax, ay = cx - size * 0.42, cy + size * 0.02
    bx, by = cx - size * 0.08, cy - size * 0.32
    cx2, cy2 = cx + size * 0.46, cy + size * 0.38
    draw_capsule(buf, w, ax, ay, bx, by, hw, WHITE)
    draw_capsule(buf, w, bx, by, cx2, cy2, hw, WHITE)


def draw_logo_mark(buf, w, cx, cy, s):
    """Centered white 'F' with a green check badge at the top-right."""
    draw_letter_f(buf, w, cx, cy, s * 0.5, s * 0.56)
    hs = s / 2.0
    badge_cx = cx + hs * 0.52
    badge_cy = cy - hs * 0.52
    badge_r = hs * 0.26
    fill_circle(buf, w, badge_cx, badge_cy, badge_r, GREEN)
    draw_check(buf, w, badge_cx, badge_cy, badge_r * 0.9)


def make_icon(path):
    w = 1024
    buf = new_canvas(w, w)
    fill_gradient(buf, w, w, BLUE_TOP, BLUE_BOTTOM)
    s = w * 0.86
    draw_logo_mark(buf, w, w / 2.0, w / 2.0, s)
    save_png(buf, w, w, path)


def make_splash(path):
    w = 1024
    buf = new_canvas(w, w, (0, 0, 0, 0))
    s = 560.0
    draw_logo_mark(buf, w, w / 2.0, w / 2.0, s)
    save_png(buf, w, w, path)


def save_png(buf, w, h, path):
    raw = bytearray()
    stride = w * 4 + 1
    for y in range(h):
        raw.append(0)
        raw.extend(buf[y * w * 4:(y + 1) * w * 4])

    def chunk(tag, data):
        c = struct.pack(">I", len(data)) + tag + data
        c += struct.pack(">I", zlib.crc32(tag + data) & 0xFFFFFFFF)
        return c

    sig = b"\x89PNG\r\n\x1a\n"
    ihdr = struct.pack(">IIBBBBB", w, h, 8, 6, 0, 0, 0)
    idat = zlib.compress(bytes(raw), 9)
    png = sig + chunk(b"IHDR", ihdr) + chunk(b"IDAT", idat) + chunk(b"IEND", b"")
    with open(path, "wb") as f:
        f.write(png)
    print("wrote", path)


def main():
    os.makedirs(OUT_DIR, exist_ok=True)
    make_icon(os.path.join(OUT_DIR, "app_icon.png"))
    make_splash(os.path.join(OUT_DIR, "splash_logo.png"))


if __name__ == "__main__":
    main()
