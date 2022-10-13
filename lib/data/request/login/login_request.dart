class LoginRequest {
  String acount;
  String passwork;

  LoginRequest({required this.acount, required this.passwork});

  Map<String, dynamic> get toJson => {'account': acount, 'hash' : passwork};
}