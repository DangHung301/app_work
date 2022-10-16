import '../../../domain/model/cv/detail_cv_model.dart';
import '../../../presentation/list_cv/ui/text_edit_controller_model.dart';
import '../../../until/const/string.dart';

class DetailCvResponse {
  bool? isprimary;
  int? id;
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
  String? userId;
  int? careerId;
  String? updatedat;
  String? createdat;

  DetailCvResponse({this.isprimary, this.id, this.title, this.displayname, this.email, this.phone, this.birthday, this.gender, this.avatar, this.height, this.weight, this.experience, this.namehighschool, this.householdnumber, this.cMND, this.interests, this.character, this.hometown, this.educationallevel, this.wish, this.specialconditions, this.salary, this.conscious, this.region, this.currentjobinformation, this.currentaddress, this.workingcompany, this.userId, this.careerId, this.updatedat, this.createdat});

  DetailCvResponse.fromJson(Map<String, dynamic> json) {
    isprimary = json['is_primary'];
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
    userId = json['userId'];
    careerId = json['careerId'];
    updatedat = json['updated_at'];
    createdat = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['is_primary'] = isprimary;
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
    data['userId'] = userId;
    data['careerId'] = careerId;
    data['updated_at'] = updatedat;
    data['created_at'] = createdat;
    return data;
  }

  List<RowDataCV> getRow(TextEditControllerModel textEditController) => [
    RowDataCV(
      controller: textEditController.tieuDeCv,
      key: StringConst.tieu_de_cv,
      value: title ?? '',
    ),
    RowDataCV(
      controller: textEditController.tenNguoiDung,
      key: StringConst.ten_nguoi_dung,
      value: displayname ?? '',
    ),
    RowDataCV(
      controller: textEditController.namSinh,
      key: StringConst.nam_sinh,
      value: '30/01/2001',
    ),
    RowDataCV(
      controller: textEditController.gioiTinh,
      key: StringConst.gioi_tinh,
      value: gender ?? '',
    ),
    RowDataCV(
      controller: textEditController.chieuCao,
      key: StringConst.chieu_cao,
      value: height ?? '',
    ),
    RowDataCV(
      controller: textEditController.canNang,
      key: StringConst.can_nang,
      value: weight ?? '',
    ),
    RowDataCV(
      controller: textEditController.kinhNghiem,
      key: StringConst.kinh_nghiem,
      value: experience ?? '',
    ),
    RowDataCV(
      controller: textEditController.tenTruongTrungHocPhoThong,
      key: StringConst.ten_truong_thpt,
      value: namehighschool ?? '',
    ),
    RowDataCV(
      controller: textEditController.soHoKhau,
      key: StringConst.so_ho_khau,
      value: householdnumber ?? '',
    ),
    RowDataCV(
      controller: textEditController.cmnd,
      key: StringConst.cmnd,
      value: cMND ?? '',
    ),
    RowDataCV(
      controller: textEditController.soThichh,
      key: StringConst.so_thich,
      value: interests ?? '',
    ),
    RowDataCV(
      controller: textEditController.tinhCach,
      key: StringConst.tinh_cach,
      value: character?? '',
    ),
    RowDataCV(
      controller: textEditController.queQuan,
      key: StringConst.que_quan,
      value: hometown ?? '',
    ),
    RowDataCV(
      controller: textEditController.trinhDoVanHoa,
      key: StringConst.trinh_do_van_hoa,
      value: educationallevel ??'',
    ),
    RowDataCV(
      controller: textEditController.nguyenVong,
      key: StringConst.nguyen_vong,
      value: wish ?? '',
    ),
    RowDataCV(
      controller: textEditController.nghanhNghe,
      key: StringConst.nghanh_nghe,
      value: currentjobinformation  ?? '',
    ),
    RowDataCV(
      controller: textEditController.dieuKienDacBiet,
      key: StringConst.dieu_kien_dac_biet,
      value: specialconditions ?? '',
    ),
    RowDataCV(
      controller: textEditController.mucLuong,
      key: StringConst.muc_luong,
      value: salary ?? '',
    ),
    RowDataCV(
      controller: textEditController.vung,
      key: StringConst.vung,
      value: region ?? '',
    ),
    RowDataCV(
      controller: textEditController.tinh,
      key: StringConst.tinh,
      value: conscious ?? '',
    ),
  ];

  List<RowDataCV> getRowDataCurrentInfomtionJob(
      TextEditControllerModel textEditController) =>
      [
        RowDataCV(
          controller: textEditController.diaChi,
          key: StringConst.dia_chi,
          value: currentaddress ?? '',
        ),
        RowDataCV(
          controller: textEditController.congty,
          key: StringConst.cong_ty,
          value: workingcompany ?? '',
        ),
        RowDataCV(
          controller: textEditController.nghanhNgheHienTai,
          key: StringConst.nghanh_nghe,
          value: currentjobinformation ?? '',
        ),
      ];
}

