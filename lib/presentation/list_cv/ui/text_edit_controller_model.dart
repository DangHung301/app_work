import 'package:flutter/material.dart';

class TextEditControllerModel {
  TextEditingController tieuDeCv = TextEditingController();
  TextEditingController tenNguoiDung = TextEditingController();
  TextEditingController namSinh = TextEditingController();
  TextEditingController gioiTinh = TextEditingController();
  TextEditingController chieuCao = TextEditingController();
  TextEditingController canNang = TextEditingController();
  TextEditingController kinhNghiem = TextEditingController();
  TextEditingController tenTruongTrungHocPhoThong = TextEditingController();
  TextEditingController soHoKhau = TextEditingController();
  TextEditingController cmnd = TextEditingController();
  TextEditingController soThichh = TextEditingController();
  TextEditingController tinhCach = TextEditingController();
  TextEditingController queQuan = TextEditingController();
  TextEditingController trinhDoVanHoa = TextEditingController();
  TextEditingController nguyenVong = TextEditingController();
  TextEditingController nghanhNghe = TextEditingController();
  TextEditingController dieuKienDacBiet = TextEditingController();
  TextEditingController mucLuong = TextEditingController();
  TextEditingController vung = TextEditingController();
  TextEditingController tinh = TextEditingController();
  TextEditingController diaChi = TextEditingController();
  TextEditingController congty = TextEditingController();
  TextEditingController nghanhNgheHienTai = TextEditingController();

  void initValue({
    required String tieuDeCv,
    required String tenNguoiDung,
    required String namSinh,
    required String gioiTinh,
    required String chieuCao,
    required String canNang,
    required String kinhNghiem,
    required String tenTruongTrungHocPhoThong,
    required String soHoKhau,
    required String cmnd,
    required String soThichh,
    required String tinhCach,
    required String queQuan,
    required String trinhDoVanHoa,
    required String nguyenVong,
    required String nghanhNghe,
    required String dieuKienDacBiet,
    required String mucLuong,
    required String vung,
    required String tinh,
    required String diaChi,
    required String congty,
    required String nghanhNgheHienTai,
  }) {
    this.tieuDeCv.text = tieuDeCv;
    this.tenNguoiDung.text = tenNguoiDung;
    this.namSinh.text = namSinh;
    this.gioiTinh.text = gioiTinh;
    this.chieuCao.text = chieuCao;
    this.canNang.text = canNang;
    this.kinhNghiem.text = kinhNghiem;
    this.tenTruongTrungHocPhoThong.text = tenTruongTrungHocPhoThong;
    this.soHoKhau.text = soHoKhau;
    this.cmnd.text = cmnd;
    this.soThichh.text = soThichh;
    this.tinhCach.text = tinhCach;
    this.queQuan.text = queQuan;
    this.trinhDoVanHoa.text = trinhDoVanHoa;
    this.nguyenVong.text = nguyenVong;
    this.nghanhNghe.text = nghanhNghe;
    this.dieuKienDacBiet.text = dieuKienDacBiet;
    this.mucLuong.text = mucLuong;
    this.vung.text = vung;
    this.tinh.text = tinh;
    this.diaChi.text = diaChi;
    this.congty.text = congty;
    this.nghanhNgheHienTai.text = nghanhNgheHienTai;
  }
}
