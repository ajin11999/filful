<p align="center">
  <img src="assets/logo/app_icon.png" alt="Filful logo" width="120" />
</p>

<h1 align="center">Filful</h1>

<p align="center">
  <strong>Offline-first goods fulfillment for purchase orders.</strong>
</p>

Filful is a Flutter app for goods suppliers who receive purchase orders (POs)
from client companies and fulfill the requested goods. Ingest POs from PDF or
Excel, track items and fulfillment batches offline, and generate delivery
notes — no internet connection required.

## Features

- **PO ingestion** — parse PDF and Excel purchase orders locally.
- **Offline tracking** — manage items and fulfillment batches on-device.
- **Delivery notes** — generate and share delivery notes.
- **Optional AI fallback** — use Gemini to extract data from unstructured or scanned POs.

## Dev setup

Prerequisites: [Flutter](https://docs.flutter.dev/get-started/install) (Dart SDK `>=3.10.0`).

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```
