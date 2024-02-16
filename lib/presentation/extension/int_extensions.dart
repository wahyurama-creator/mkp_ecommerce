import 'package:intl/intl.dart';

extension IntExtensions on double {
  String toCurrencyFormat() => NumberFormat.currency(
        symbol: '\$ ',
      ).format(this);
}
