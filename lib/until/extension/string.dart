import 'package:recruit_app/until/const/string.dart';

extension ExtensionString on String {
  String? checkNull() {
    if (trim().isEmpty) {
      return StringConst.khong_duoc_de_trong;
    }
    return null;
  }

  DateTime get convertStringToDate {
    if (contains('/')) {
      return DateTime.parse(this);
    } else {
      return DateTime.parse(this);
    }
  }

  String get cleanHtmlText {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );

    return replaceAll(exp, '');
  }
}
