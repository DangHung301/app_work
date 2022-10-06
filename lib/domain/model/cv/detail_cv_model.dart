import 'package:flutter/cupertino.dart';
import 'package:recruit_app/presentation/list_cv/ui/text_edit_controller_model.dart';
import 'package:recruit_app/until/const/string.dart';

class DetailCVModel {
  String tieuDeCv;
  String tenNguoiDung;
  String namSinh;
  String gioiTinh;
  String chieuCao;
  String canNang;
  String kinhNghiem;
  String tenTruongTrungHocPhoThong;
  String soHoKhau;
  String cmnd;
  String soThichh;
  String tinhCach;
  String queQuan;
  String trinhDoVanHoa;
  String nguyenVong;
  String nghanhNghe;
  String dieuKienDacBiet;
  String mucLuong;
  String vung;
  String tinh;
  CurrentInfmationJob currentInfmationJob;

  DetailCVModel(
      {required this.tieuDeCv,
      required this.tenNguoiDung,
      required this.namSinh,
      required this.gioiTinh,
      required this.chieuCao,
      required this.canNang,
      required this.kinhNghiem,
      required this.tenTruongTrungHocPhoThong,
      required this.soHoKhau,
      required this.cmnd,
      required this.soThichh,
      required this.tinhCach,
      required this.queQuan,
      required this.trinhDoVanHoa,
      required this.nguyenVong,
      required this.nghanhNghe,
      required this.dieuKienDacBiet,
      required this.mucLuong,
      required this.vung,
      required this.tinh,
      required this.currentInfmationJob});

  List<RowDataCV> getRow(TextEditControllerModel textEditController) => [
        RowDataCV(
          controller: textEditController.tieuDeCv,
          key: StringConst.tieu_de_cv,
          value: tieuDeCv,
        ),
        RowDataCV(
          controller: textEditController.tenNguoiDung,
          key: StringConst.ten_nguoi_dung,
          value: tenNguoiDung,
        ),
        RowDataCV(
          controller: textEditController.namSinh,
          key: StringConst.nam_sinh,
          value: namSinh,
        ),
        RowDataCV(
          controller: textEditController.gioiTinh,
          key: StringConst.gioi_tinh,
          value: gioiTinh,
        ),
        RowDataCV(
          controller: textEditController.chieuCao,
          key: StringConst.chieu_cao,
          value: chieuCao,
        ),
        RowDataCV(
          controller: textEditController.canNang,
          key: StringConst.can_nang,
          value: canNang,
        ),
        RowDataCV(
          controller: textEditController.kinhNghiem,
          key: StringConst.kinh_nghiem,
          value: kinhNghiem,
        ),
        RowDataCV(
          controller: textEditController.tenTruongTrungHocPhoThong,
          key: StringConst.ten_truong_thpt,
          value: tenTruongTrungHocPhoThong,
        ),
        RowDataCV(
          controller: textEditController.soHoKhau,
          key: StringConst.so_ho_khau,
          value: soHoKhau,
        ),
        RowDataCV(
          controller: textEditController.cmnd,
          key: StringConst.cmnd,
          value: cmnd,
        ),
        RowDataCV(
          controller: textEditController.soThichh,
          key: StringConst.so_thich,
          value: soThichh,
        ),
        RowDataCV(
          controller: textEditController.tinhCach,
          key: StringConst.tinh_cach,
          value: tinhCach,
        ),
        RowDataCV(
          controller: textEditController.queQuan,
          key: StringConst.que_quan,
          value: queQuan,
        ),
        RowDataCV(
          controller: textEditController.trinhDoVanHoa,
          key: StringConst.trinh_do_van_hoa,
          value: trinhDoVanHoa,
        ),
        RowDataCV(
          controller: textEditController.nguyenVong,
          key: StringConst.nguyen_vong,
          value: nguyenVong,
        ),
        RowDataCV(
          controller: textEditController.nghanhNghe,
          key: StringConst.nghanh_nghe,
          value: nghanhNghe,
        ),
        RowDataCV(
          controller: textEditController.dieuKienDacBiet,
          key: StringConst.dieu_kien_dac_biet,
          value: dieuKienDacBiet,
        ),
        RowDataCV(
          controller: textEditController.mucLuong,
          key: StringConst.muc_luong,
          value: mucLuong,
        ),
        RowDataCV(
          controller: textEditController.vung,
          key: StringConst.vung,
          value: vung,
        ),
        RowDataCV(
          controller: textEditController.tinh,
          key: StringConst.tinh,
          value: tinh,
        ),
      ];
}

class CurrentInfmationJob {
  String diaChi;
  String congty;
  String nghanhNghe;
  String anhChungChi;

  CurrentInfmationJob(
      {required this.diaChi,
      required this.congty,
      required this.nghanhNghe,
      required this.anhChungChi});

  List<RowDataCV> getRowDataCurrentInfomtionJob(
          TextEditControllerModel textEditController) =>
      [
        RowDataCV(
          controller: textEditController.diaChi,
          key: StringConst.dia_chi,
          value: diaChi,
        ),
        RowDataCV(
          controller: textEditController.congty,
          key: StringConst.cong_ty,
          value: diaChi,
        ),
        RowDataCV(
          controller: textEditController.nghanhNgheHienTai,
          key: StringConst.nghanh_nghe,
          value: diaChi,
        ),
      ];
}

class RowDataCV {
  TextEditingController controller;
  String key;
  String value;

  RowDataCV({required this.controller, required this.key, required this.value});
}
