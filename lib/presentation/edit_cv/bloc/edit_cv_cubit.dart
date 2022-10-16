import 'dart:io';

import 'package:get/get.dart';
import 'package:recruit_app/config/base/base_cubit.dart';
import 'package:recruit_app/data/response/cv/detail_cv_response.dart';
import 'package:recruit_app/domain/repositories/repo/cv/cv_repository.dart';
import 'package:recruit_app/presentation/edit_cv/bloc/edit_cv_state.dart';
import 'package:recruit_app/presentation/list_cv/ui/text_edit_controller_model.dart';
import 'package:recruit_app/widget/dialog/message_config/message_config.dart';
import 'package:rxdart/rxdart.dart';

import '../../../config/local/prefs_service.dart';
import '../../../data/request/cv/create_cv_request.dart';

class EditCVCubit extends BaseCubit<EditCVState> {
  EditCVCubit() : super(EditCVStateInit());

  CvRepository repo = Get.find();

  TextEditControllerModel textEditControllerModel = TextEditControllerModel();

  BehaviorSubject<bool> isValidateEdit = BehaviorSubject();

  BehaviorSubject<DetailCvResponse> cvSubject = BehaviorSubject();

  Future<void> initData(String id) async {
    showLoading();
    await getCV(id);
    showContent();
  }

  Future<void> getCV(String id) async {
    final result = await repo.detailCv(int.parse(id));

    result.when(
        success: (success) {
          cvSubject.add(success);
          initValueEditCv(success);
        },
        error: (error) {});
  }

  void initValueEditCv(DetailCvResponse data) {
    textEditControllerModel.initValue(
        tieuDeCv: data.title ?? '',
        tenNguoiDung: data.displayname ?? '',
        namSinh: '30/01/2001',
        gioiTinh: data.gender ?? '',
        chieuCao: data.height ?? '',
        canNang: data.weight ?? '',
        kinhNghiem: data.experience ?? '',
        tenTruongTrungHocPhoThong: data.namehighschool ?? '',
        soHoKhau: data.householdnumber ?? '',
        cmnd: data.cMND ?? '',
        soThichh: data.interests ?? '',
        tinhCach: data.character ?? '',
        queQuan: data.hometown ?? '',
        trinhDoVanHoa: data.educationallevel ?? '',
        nguyenVong: data.wish ?? '',
        nghanhNghe: data.currentjobinformation ?? '',
        dieuKienDacBiet: data.specialconditions ?? '',
        mucLuong: data.salary ?? '',
        vung: data.region ?? '',
        tinh: data.conscious ?? '',
        diaChi: data.title ?? '',
        congty: data.workingcompany ?? '',
        nghanhNgheHienTai: data.workingcompany ?? '');
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

  Future<void> editCV({required File image, required int id}) async {
    showLoading();
    String fileName = '';
    if (image.path.isNotEmpty) {
      fileName = await upLoadFile(image);
    } else {
      fileName = cvSubject.valueOrNull?.certificatephoto ?? '';
    }

    final result = await repo.updateCv(
        CreateCvRequest(
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
          namehighschool:
              textEditControllerModel.tenTruongTrungHocPhoThong.text,
          region: textEditControllerModel.vung.text,
          salary: textEditControllerModel.mucLuong.text,
          specialconditions: textEditControllerModel.dieuKienDacBiet.text,
          userId: PrefsService.getUserId(),
          weight: textEditControllerModel.canNang.text,
          wish: textEditControllerModel.nguyenVong.text,
          workingcompany: textEditControllerModel.congty.text,
        ),
        id);

    result.when(success: (success) {
      if (success.message == 'CV was updated successfully.') {
        MessageConfig.show(title: 'Cập nhật CV thành công');
      } else {
        MessageConfig.show(
            title: ((success.message ?? '').isEmpty)
                ? 'Vui lòng thử lại'
                : (success.message ?? ''));
      }
    }, error: (error) {
      MessageConfig.show(title: error.toString());
    });
    showContent();
  }

  void enableValidate() {
    isValidateEdit.add(true);
  }

  void disableValidate() {
    isValidateEdit.add(false);
  }
}
