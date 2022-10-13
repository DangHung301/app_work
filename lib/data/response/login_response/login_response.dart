import 'package:recruit_app/domain/model/login_model/login_model.dart';

class LoginResponse {
  UserResponse? user;
  String? token;

  LoginResponse({this.user, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserResponse?.fromJson(json['user']) : null;
    token = json['token'];
  }

  LoginModel get toModel =>
      LoginModel(user: user!.toModel , token: token ?? '');

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
  String? createdat;
  String? updatedat;

  UserResponse.empty();

  UserResponse(
      {this.id, this.email, this.displayname, this.createdat, this.updatedat});

  UserModel get toModel =>
      UserModel(id: id ?? '',
          email: email ?? '',
          displayname: displayname ?? '',
          createdat: createdat ?? '',
          updatedat: updatedat ?? '');

  UserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    displayname = json['display_name'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['display_name'] = displayname;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}
