class UserRequest {
  String? email;
  String? displayname;
  int? birthday;
  String? gender;

  UserRequest({
    this.email,
    this.displayname,
    this.birthday,
    this.gender,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = email;
    data['display_name'] = displayname;
    data['birthday'] = birthday;
    data['gender'] = gender;

    return data;
  }
}
