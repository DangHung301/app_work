import 'package:recruit_app/domain/model/detail_job/detail_job_model.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/until/extension/date_time.dart';
import 'package:recruit_app/until/extension/string.dart';

class CareerResponse {
  String? id;
  String? name;
  String? details;
  String? createdat;
  String? updatedat;

  CareerResponse(
      {this.id, this.name, this.details, this.createdat, this.updatedat});

  CareerResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['details'] = details;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class CompanyResponse {
  String? id;
  String? name;
  String? details;
  String? address;
  String? scale;
  String? createdat;
  String? updatedat;

  CompanyResponse(
      {this.id,
      this.name,
      this.details,
      this.address,
      this.scale,
      this.createdat,
      this.updatedat});

  CompanyResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    address = json['address'];
    scale = json['scale'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['details'] = details;
    data['address'] = address;
    data['scale'] = scale;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }

  List<RowData> get companyInfomationData => [
        RowData(key: StringConst.ten_cong_ty, value: name ?? ''),
        RowData(key: StringConst.dia_chi, value: address),
        RowData(key: StringConst.gioi_thieu, value: details),
        RowData(
            key: StringConst.thoi_gian_tuyen_dung,
            value:
                '${(createdat ?? '').convertStringToDate.formatDdMMYYYY} đến ${(createdat ?? '').convertStringToDate.formatDdMMYYYY}'),
      ];
}

class DetailJobResponse {
  String? id;
  String? name;
  String? salary;
  String? recruitquantity;
  String? sex;
  String? age;
  String? englishlevel;
  String? experience;
  String? otherrequirements;
  String? contactinfo;
  String? area;
  String? workaddress;
  String? level;
  int? starttime;
  int? endtime;
  String? createdat;
  String? updatedat;
  String? careerId;
  String? companyId;
  CompanyResponse? company;
  CareerResponse? career;
  bool? appliedjob;
  bool? savedjob;

  DetailJobResponse(
      {this.id,
      this.name,
      this.salary,
      this.recruitquantity,
      this.sex,
      this.age,
      this.englishlevel,
      this.experience,
      this.otherrequirements,
      this.contactinfo,
      this.area,
      this.workaddress,
      this.level,
      this.starttime,
      this.endtime,
      this.createdat,
      this.updatedat,
      this.careerId,
      this.companyId,
      this.company,
      this.career,
      this.appliedjob,
      this.savedjob});

  DetailJobResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    salary = json['salary'];
    recruitquantity = json['recruit_quantity'];
    sex = json['sex'];
    age = json['age'];
    englishlevel = json['english_level'];
    experience = json['experience'];
    otherrequirements = json['other_requirements'];
    contactinfo = json['contact_info'];
    area = json['area'];
    workaddress = json['work_address'];
    level = json['level'];
    starttime = json['start_time'];
    endtime = json['end_time'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
    careerId = json['careerId'];
    companyId = json['companyId'];
    company = json['company'] != null
        ? CompanyResponse?.fromJson(json['company'])
        : null;
    career = json['career'] != null
        ? CareerResponse?.fromJson(json['career'])
        : null;
    appliedjob = json['applied_job'];
    savedjob = json['saved_job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['salary'] = salary;
    data['recruit_quantity'] = recruitquantity;
    data['sex'] = sex;
    data['age'] = age;
    data['english_level'] = englishlevel;
    data['experience'] = experience;
    data['other_requirements'] = otherrequirements;
    data['contact_info'] = contactinfo;
    data['area'] = area;
    data['work_address'] = workaddress;
    data['level'] = level;
    data['start_time'] = starttime;
    data['end_time'] = endtime;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    data['careerId'] = careerId;
    data['companyId'] = companyId;
    data['company'] = company!.toJson();
    data['career'] = career!.toJson();
    data['applied_job'] = appliedjob;
    data['saved_job'] = savedjob;
    return data;
  }

  List<RowData> get genaralDatas => [
    RowData(key: StringConst.muc_luong, value: salary),
    RowData(key: StringConst.so_luong_can_tuyen, value: recruitquantity),
    RowData(key: StringConst.gioi_tinh, value: sex),
    RowData(key: StringConst.kinh_nghiem, value: experience?.cleanHtmlText),
    RowData(key: StringConst.dia_chi, value: workaddress),
    RowData(key: StringConst.trinh_do_ngoai_ngu, value: englishlevel),
    RowData(key: StringConst.yeu_cau_khac, value: otherrequirements),
  ];
}
