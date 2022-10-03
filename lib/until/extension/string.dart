import 'package:intl/intl.dart';
import 'package:recruit_app/until/const/string.dart';

extension ExtensionString on String {
  String? checkNull() {
    if (trim().isEmpty) {
      return StringConst.khong_duoc_de_trong;
    }
    return null;
  }

  DateTime get convertStringToDate {
    return DateFormat('dd/MM/yyyy').parse(this);
  }
}
