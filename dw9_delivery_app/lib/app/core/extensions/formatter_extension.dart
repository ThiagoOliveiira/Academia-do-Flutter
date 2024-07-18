import 'package:intl/intl.dart';

extension FormatterExtension on double {
  String get currentPTBR {
    final currenceFormat = NumberFormat.currency(symbol: r'R$', locale: 'pt_BR');
    return currenceFormat.format(this);
  }
}
