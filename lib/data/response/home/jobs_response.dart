/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class JobDataResponse {
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
  bool? appliedjob;
  bool? savedjob;

  JobDataResponse({this.id, this.name, this.salary, this.recruitquantity, this.sex, this.age, this.englishlevel, this.experience, this.otherrequirements, this.contactinfo, this.area, this.workaddress, this.level, this.starttime, this.endtime, this.createdat, this.updatedat, this.careerId, this.companyId, this.appliedjob, this.savedjob});

  JobDataResponse.fromJson(Map<String, dynamic> json) {
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
    data['applied_job'] = appliedjob;
    data['saved_job'] = savedjob;
    return data;
  }
}

class JobsResponse {
  int? totalItems;
  List<JobDataResponse?>? items;
  int? totalPages;
  int? currentPage;

  JobsResponse({this.totalItems, this.items, this.totalPages, this.currentPage});

  JobsResponse.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      items = <JobDataResponse>[];
      json['items'].forEach((v) {
        items!.add(JobDataResponse.fromJson(v));
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

