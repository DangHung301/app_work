import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recruit_app/config/base/base_cubit.dart';
import 'package:recruit_app/config/local/prefs_service.dart';
import 'package:recruit_app/data/response/cv/detail_cv_response.dart';
import 'package:recruit_app/domain/repositories/repo/cv/cv_repository.dart';
import 'package:recruit_app/presentation/create_cv/bloc/create_cv_state.dart';
import 'package:recruit_app/widget/dialog/message_config/message_config.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/request/cv/create_cv_request.dart';
import '../../list_cv/ui/text_edit_controller_model.dart';

class CreateCVCubit extends BaseCubit<CreateCVState> {
  CreateCVCubit() : super(CreateCVStateIntial());

  CvRepository repo = Get.find();

  BehaviorSubject<bool> cvSubject = BehaviorSubject();

  DetailCvResponse data = DetailCvResponse();

  void init() {
    showContent();
  }

  final BehaviorSubject<File?> imageSubject = BehaviorSubject.seeded(null);

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    File? result;
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      result = File(image.path);
    }

    imageSubject.add(result);
  }

  Future<String> upLoadFile(File file) async {
    String value = '';

    final result = await repo.uploadFile(file);

    result.when(
        success: (success) {
          value = success.filename ?? '';
        },
        error: (error) {});

    return value;
  }

  Future<void> createCV(
      TextEditControllerModel textEditControllerModel, File image) async {
    showLoading();
    String fileName = '';
    if (image.path.isNotEmpty) {
      fileName = await upLoadFile(image);
    }
    final result = await repo.createCV(CreateCvRequest(
      title: textEditControllerModel.tieuDeCv.text,
      gender: textEditControllerModel.gioiTinh.text,
      experience: textEditControllerModel.kinhNghiem.text,
      height: textEditControllerModel.chieuCao.text,
      birthday: 1111,
      careerId: 1,
      cMND: textEditControllerModel.cmnd.text,
      character: textEditControllerModel.tinhCach.text,
      conscious: textEditControllerModel.tinh.text,
      certificatephoto: fileName,
      currentaddress: textEditControllerModel.diaChi.text,
      currentjobinformation: textEditControllerModel.nghanhNghe.text,
      displayname: textEditControllerModel.tenNguoiDung.text,
      educationallevel: textEditControllerModel.trinhDoVanHoa.text,
      hometown: textEditControllerModel.queQuan.text,
      householdnumber: textEditControllerModel.soHoKhau.text,
      interests: textEditControllerModel.soThichh.text,
      namehighschool: textEditControllerModel.tenTruongTrungHocPhoThong.text,
      region: textEditControllerModel.vung.text,
      salary: textEditControllerModel.mucLuong.text,
      specialconditions: textEditControllerModel.dieuKienDacBiet.text,
      userId: PrefsService.getUserId(),
      weight: textEditControllerModel.canNang.text,
      wish: textEditControllerModel.nguyenVong.text,
      workingcompany: textEditControllerModel.congty.text,
    ));

    result.when(success: (success) {
      MessageConfig.show(title: 'Tạo CV thành công');
      cvSubject.add(true);
    }, error: (error) {
      cvSubject.add(false);
    });
    cvSubject.add(false);
    showContent();
  }
}
