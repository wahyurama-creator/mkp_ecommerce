import 'package:intl/intl.dart';

extension IntExtensions on double {
  /// Convert int to IDR currency format
  String toIDRCurrencyFormat() => NumberFormat.currency(
        symbol: '\$ ',
      ).format(this);
}
