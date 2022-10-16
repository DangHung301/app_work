class CreateCvRequest {
  String? title;
  String? displayname;
  String? email;
  String? phone;
  int? birthday;
  String? gender;
  String? avatar;
  String? height;
  String? weight;
  String? experience;
  String? namehighschool;
  String? householdnumber;
  String? cMND;
  String? interests;
  String? character;
  String? hometown;
  String? educationallevel;
  String? wish;
  String? specialconditions;
  String? salary;
  String? conscious;
  String? region;
  String? currentjobinformation;
  String? currentaddress;
  String? workingcompany;
  String? certificatephoto;
  String? userId;
  int? careerId;

  CreateCvRequest(
      {this.title,
      this.displayname,
      this.email,
      this.phone,
      this.birthday,
      this.gender,
      this.avatar,
      this.height,
      this.weight,
      this.experience,
      this.namehighschool,
      this.householdnumber,
      this.cMND,
      this.interests,
      this.character,
      this.hometown,
      this.educationallevel,
      this.wish,
      this.specialconditions,
      this.salary,
      this.conscious,
      this.region,
      this.currentjobinformation,
      this.currentaddress,
      this.workingcompany,
      this.certificatephoto,
      this.userId,
      this.careerId});

  CreateCvRequest.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    displayname = json['display_name'];
    email = json['email'];
    phone = json['phone'];
    birthday = json['birthday'];
    gender = json['gender'];
    avatar = json['avatar'];
    height = json['height'];
    weight = json['weight'];
    experience = json['experience'];
    namehighschool = json['name_high_school'];
    householdnumber = json['household_number'];
    cMND = json['CMND'];
    interests = json['interests'];
    character = json['character'];
    hometown = json['home_town'];
    educationallevel = json['educational_level'];
    wish = json['wish'];
    specialconditions = json['special_conditions'];
    salary = json['salary'];
    conscious = json['conscious'];
    region = json['region'];
    currentjobinformation = json['current_job_information'];
    currentaddress = json['current_address'];
    workingcompany = json['working_company'];
    certificatephoto = json['certificate_photo'];
    userId = json['userId'];
    careerId = json['careerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['display_name'] = displayname;
    data['email'] = email;
    data['phone'] = phone;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['avatar'] = avatar;
    data['height'] = height;
    data['weight'] = weight;
    data['experience'] = experience;
    data['name_high_school'] = namehighschool;
    data['household_number'] = householdnumber;
    data['CMND'] = cMND;
    data['interests'] = interests;
    data['character'] = character;
    data['home_town'] = hometown;
    data['educational_level'] = educationallevel;
    data['wish'] = wish;
    data['special_conditions'] = specialconditions;
    data['salary'] = salary;
    data['conscious'] = conscious;
    data['region'] = region;
    data['current_job_information'] = currentjobinformation;
    data['current_address'] = currentaddress;
    data['working_company'] = workingcompany;
    if( (certificatephoto ?? '').isNotEmpty) {
      data['certificate_photo'] = certificatephoto;
    }
    data['userId'] = userId;
    data['careerId'] = careerId;
    return data;
  }
}
