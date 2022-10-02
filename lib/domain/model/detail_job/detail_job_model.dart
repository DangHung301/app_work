import 'package:recruit_app/until/const/string.dart';

class DetailJobModel {
  String logoCompany;
  String nameCompany;
  String rangeSalary;
  String nameJob;
  int numberRecuit;
  String gender;
  String rangeAge;
  String levelEnglish;
  String experience;
  String misc;
  String numberPhone;
  String employer;
  String addressCompany;
  String startDate;
  String endDate;
  CompanyModel? companyModel;

  DetailJobModel({
    required this.rangeSalary,
    required this.nameJob,
    required this.numberRecuit,
    required this.gender,
    required this.rangeAge,
    required this.levelEnglish,
    required this.experience,
    required this.misc,
    required this.numberPhone,
    required this.employer,
    required this.addressCompany,
    required this.startDate,
    required this.endDate,
    required this.logoCompany,
    required this.nameCompany,
    this.companyModel,
  });

  List<RowData> get genaralDatas => [
        RowData(key: StringConst.muc_luong, value: rangeSalary),
        RowData(key: StringConst.so_luong_can_tuyen, value: rangeSalary),
        RowData(key: StringConst.gioi_tinh, value: gender),
        RowData(key: StringConst.kinh_nghiem, value: experience),
        RowData(key: StringConst.dia_chi, value: addressCompany),
        RowData(key: StringConst.trinh_do_ngoai_ngu, value: levelEnglish),
        RowData(key: StringConst.yeu_cau_khac, value: misc),
      ];

  List<RowData> get companyInfomationData => [
        RowData(
            key: StringConst.ten_cong_ty,
            value: companyModel?.nameCompany ??

                ''),
        RowData(key: StringConst.dia_chi, value: addressCompany),
        RowData(
            key: StringConst.gioi_thieu, value: companyModel?.summary ?? ''),
        RowData(
            key: StringConst.thoi_gian_tuyen_dung,
            value: '$startDate đến $endDate'),
      ];
}

class CompanyModel {
  String nameCompany;
  String summary;

  CompanyModel({required this.nameCompany, required this.summary});
}

class RowData {
  String key;
  dynamic value;

  RowData({required this.key, required this.value});
}
