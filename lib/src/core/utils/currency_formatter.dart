import 'package:intl/intl.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  static final NumberFormat _idrFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  static final NumberFormat _qtyFormat = NumberFormat('#,##0.##', 'id_ID');

  static String formatIdr(double amount) {
    return _idrFormat.format(amount);
  }

  static String formatCompactIdr(double amount) {
    if (amount >= 1000000000) {
      return 'Rp ${(amount / 1000000000).toStringAsFixed(1)} M';
    } else if (amount >= 1000000) {
      return 'Rp ${(amount / 1000000).toStringAsFixed(1)} jt';
    } else if (amount >= 1000) {
      return 'Rp ${(amount / 1000).toStringAsFixed(0)} rb';
    }
    return formatIdr(amount);
  }

  static String formatQty(double qty) {
    return _qtyFormat.format(qty);
  }
}
