class Terbilang {
  Terbilang._();

  static const List<String> _words = [
    '',
    'Satu',
    'Dua',
    'Tiga',
    'Empat',
    'Lima',
    'Enam',
    'Tujuh',
    'Delapan',
    'Sembilan',
    'Sepuluh',
    'Sebelas',
  ];

  static String convert(double number) {
    final n = number.round();
    if (n < 0) return 'Minus ${_convert(n.abs())} Rupiah';
    if (n == 0) return 'Nol Rupiah';
    return '${_convert(n)} Rupiah';
  }

  static String _convert(int n) {
    if (n < 12) {
      return _words[n];
    } else if (n < 20) {
      return '${_convert(n - 10)} Belas';
    } else if (n < 100) {
      return '${_convert(n ~/ 10)} Puluh ${_convert(n % 10)}'.trim();
    } else if (n < 200) {
      return 'Seratus ${_convert(n - 100)}'.trim();
    } else if (n < 1000) {
      return '${_convert(n ~/ 100)} Ratus ${_convert(n % 100)}'.trim();
    } else if (n < 2000) {
      return 'Seribu ${_convert(n - 1000)}'.trim();
    } else if (n < 1000000) {
      return '${_convert(n ~/ 1000)} Ribu ${_convert(n % 1000)}'.trim();
    } else if (n < 1000000000) {
      return '${_convert(n ~/ 1000000)} Juta ${_convert(n % 1000000)}'.trim();
    } else if (n < 1000000000000) {
      return '${_convert(n ~/ 1000000000)} Miliar ${_convert(n % 1000000000)}'.trim();
    } else {
      return '${_convert(n ~/ 1000000000000)} Triliun ${_convert(n % 1000000000000)}'.trim();
    }
  }
}
