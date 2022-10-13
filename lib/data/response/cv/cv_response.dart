
class CvDataResponse {
  String? id;
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
  bool? isprimary;
  String? createdat;
  String? updatedat;
  String? userId;
  String? careerId;

  CvDataResponse({this.id, this.title, this.displayname, this.email, this.phone, this.birthday, this.gender, this.avatar, this.height, this.weight, this.experience, this.namehighschool, this.householdnumber, this.cMND, this.interests, this.character, this.hometown, this.educationallevel, this.wish, this.specialconditions, this.salary, this.conscious, this.region, this.currentjobinformation, this.currentaddress, this.workingcompany, this.certificatephoto, this.isprimary, this.createdat, this.updatedat, this.userId, this.careerId});

  CvDataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    isprimary = json['is_primary'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
    userId = json['userId'];
    careerId = json['careerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
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
    data['certificate_photo'] = certificatephoto;
    data['is_primary'] = isprimary;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    data['userId'] = userId;
    data['careerId'] = careerId;
    return data;
  }
}

class CVResponse {
  int? totalItems;
  List<CvDataResponse?>? items;
  int? totalPages;
  int? currentPage;

  CVResponse({this.totalItems, this.items, this.totalPages, this.currentPage});

  CVResponse.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      items = <CvDataResponse>[];
      json['items'].forEach((v) {
        items!.add(CvDataResponse.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['totalItems'] = totalItems;
    data['items'] =items != null ? items!.map((v) => v?.toJson()).toList() : null;
    data['totalPages'] = totalPages;
    data['currentPage'] = currentPage;
    return data;
  }
}

