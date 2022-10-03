
import 'package:intl/intl.dart';

extension DateFormatString on DateTime {
  String get toStringWithAMPM {
    final dateString = DateFormat.jm('en').format(this);
    return dateString;
  }
  String get formatDdMMYYYY {
    final dateString =
    DateFormat('dd/MM/yyyy ').format(this);
    return dateString;
  }
  String get formatHHmmDdMMYYYY {
    final dateString =
    DateFormat('HH:mm dd/MM/yyyy ').format(this);
    return dateString;
  }
  int get convertToTimesTamp {
    return millisecondsSinceEpoch;
  }
}
