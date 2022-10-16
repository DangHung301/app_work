import 'package:recruit_app/until/extension/date_time.dart';
import 'package:recruit_app/until/extension/int.dart';

import '../../../domain/model/detail_job/detail_job_model.dart';
import '../../../until/const/string.dart';

class LoginResponse {
  UserResponse? user;
  String? token;

  LoginResponse({this.user, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserResponse?.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user'] = user!.toJson();
    data['token'] = token;
    return data;
  }
}

class UserResponse {
  String? id;
  String? email;
  String? displayname;
  int? birthday;
  String? gender;

  UserResponse({
    this.id,
    this.email,
    this.displayname,
    this.birthday,
    this.gender,
  });

  UserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    displayname = json['display_name'];
    birthday = json['birthday'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['display_name'] = displayname;
    data['birthday'] = birthday;
    data['gender'] = gender;
    return data;
  }

  List<RowData> rowInfomation() => [
        RowData(key: StringConst.ho_va_ten, value: displayname ?? ''),
        RowData(key: StringConst.email, value: email),
        RowData(
            key: StringConst.ngay_sinh,
            value: (birthday ?? 0).convertToDateTime.formatDdMMYYYY),
        RowData(key: StringConst.gioi_tinh, value: gender),
      ];
}
