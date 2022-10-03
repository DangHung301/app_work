import 'package:recruit_app/domain/model/detail_job/detail_job_model.dart';
import 'package:recruit_app/until/const/string.dart';

class PersonalInfomationModel {
  String name;
  int age;
  String date;
  String gender;

  PersonalInfomationModel(
      {required this.name,
      required this.age,
      required this.date,
      required this.gender});

  List<RowData> rowInfomation() => [
        RowData(key: StringConst.ho_va_ten, value: name),
        RowData(key: StringConst.tuoi, value: age.toString()),
        RowData(key: StringConst.ngay_sinh, value: date),
        RowData(key: StringConst.gioi_tinh, value: gender),
      ];
}
