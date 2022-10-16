import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:recruit_app/config/base/base_cubit.dart';
import 'package:recruit_app/domain/model/cv/detail_cv_model.dart';
import 'package:recruit_app/presentation/edit_cv/bloc/edit_cv_state.dart';
import 'package:recruit_app/presentation/list_cv/ui/text_edit_controller_model.dart';
import 'package:rxdart/rxdart.dart';

class EditCVCubit extends BaseCubit<EditCVState> {
  EditCVCubit() : super(EditCVStateInit());

  DetailCVModel fakeDetailCV = DetailCVModel(
      tieuDeCv: 'Tim viec Mobile',
      tenNguoiDung: 'Nguyen Van A',
      namSinh: '30/01/2001',
      gioiTinh: 'Nam',
      chieuCao: '1m81',
      canNang: '72kg',
      kinhNghiem: '1 năm',
      tenTruongTrungHocPhoThong: 'ABC',
      soHoKhau: '19213123',
      cmnd: '21413214123',
      soThichh: 'Đá bóng, nghe nhạc, ....',
      tinhCach: 'Vui vẻ, hoà đồng',
      queQuan: 'ABC',
      trinhDoVanHoa: 'Đại học',
      nguyenVong: 'ABC',
      nghanhNghe: 'Mobile',
      dieuKienDacBiet: 'ABC',
      mucLuong: '100tr',
      vung: 'ABC',
      tinh: 'ABC',
      currentInfmationJob: CurrentInfmationJob(
          diaChi: 'Ha Noi',
          congty: 'ABC',
          nghanhNghe: 'Mobile',
          anhChungChi:
              'https://lambanguytin.com/wp-content/uploads/2020/08/H%C3%ACnh-%E1%BA%A3nh-c%E1%BB%A7a-ch%E1%BB%A9ng-ch%E1%BB%89-tin-h%E1%BB%8Dc-c%C6%A1-b%E1%BA%A3n.png'));

  BehaviorSubject<bool> isValidateEdit = BehaviorSubject();
  BehaviorSubject<DetailCVModel> cvSubject = BehaviorSubject();
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

  void init(TextEditControllerModel model) {
    cvSubject.add(fakeDetailCV);
    model.tieuDeCv.text = cvSubject.value.tieuDeCv;
    model.tenNguoiDung.text = cvSubject.value.tenNguoiDung;
    model.namSinh.text = cvSubject.value.namSinh;
    model.gioiTinh.text = cvSubject.value.gioiTinh;
    model.chieuCao.text = cvSubject.value.chieuCao;
    model.canNang.text = cvSubject.value.canNang;
    model.kinhNghiem.text = cvSubject.value.kinhNghiem;
    model.tenTruongTrungHocPhoThong.text =
        cvSubject.value.tenTruongTrungHocPhoThong;
    model.soThichh.text = cvSubject.value.soThichh;
    model.tinhCach.text = cvSubject.value.tinhCach;
    model.queQuan.text = cvSubject.value.queQuan;
    model.trinhDoVanHoa.text = cvSubject.value.trinhDoVanHoa;
    model.nguyenVong.text = cvSubject.value.nguyenVong;
    model.nghanhNghe.text = cvSubject.value.nghanhNghe;
    model.dieuKienDacBiet.text = cvSubject.value.dieuKienDacBiet;
    model.vung.text = cvSubject.value.vung;
    model.tinh.text = cvSubject.value.tinh;
    model.cmnd.text = cvSubject.value.cmnd;
    model.mucLuong.text = cvSubject.value.mucLuong;
    model.soHoKhau.text = cvSubject.value.soHoKhau;
    model.diaChi.text = cvSubject.value.currentInfmationJob.diaChi;
    model.congty.text = cvSubject.value.currentInfmationJob.congty;
    model.nghanhNgheHienTai.text =
        cvSubject.value.currentInfmationJob.nghanhNghe;
  }

  void enableValidate() {
    isValidateEdit.add(true);
  }

  void disableValidate() {
    isValidateEdit.add(false);
  }
}
