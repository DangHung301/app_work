class LoginModel {
  UserModel user;
  String token;

  LoginModel({required this.user, required this.token});
}

class UserModel {
  String id;
  String email;
  String displayname;
  String createdat;
  String updatedat;

  UserModel(
      {required this.id,
      required this.email,
      required this.displayname,
      required this.createdat,
      required this.updatedat});
}
