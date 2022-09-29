import 'package:recruit_app/until/const/string.dart';

enum TypeMenu {
  TRANG_CHU, DANH_SACH_CONG_VIEC_DA_LUU, DANH_SACH_CONG_VIEC_DA_UNG_TUYEN, THONG_TIN_CA_NHAN, DANG_XUAT
}

extension ExtensionTypeMenu on TypeMenu {
  String get getNameMenu {
    switch (this){
      case TypeMenu.TRANG_CHU: return StringConst.trang_chu;
      case TypeMenu.DANH_SACH_CONG_VIEC_DA_LUU: return StringConst.danh_sach_cong_viec_da_luu;
      case TypeMenu.DANH_SACH_CONG_VIEC_DA_UNG_TUYEN: return StringConst.danh_sach_cong_viec_da_ung_tuyen;
      case TypeMenu.THONG_TIN_CA_NHAN: return StringConst.thong_tin_ca_nhan;
      case TypeMenu.DANG_XUAT: return StringConst.dang_xuat;
    }
  }

  void selectMenu() {
    for(ContainerMenu e in dataMenu) {
      if(this == e.typeMenu) {
        e.isSelect = true;
      } else{ e.isSelect = false;}
    }
  }
}

List<ContainerMenu> dataMenu = [
  ContainerMenu(isSelect: true, typeMenu: TypeMenu.TRANG_CHU),
  ContainerMenu(isSelect: false, typeMenu: TypeMenu.DANH_SACH_CONG_VIEC_DA_LUU),
  ContainerMenu(isSelect: false, typeMenu: TypeMenu.DANH_SACH_CONG_VIEC_DA_UNG_TUYEN),
  ContainerMenu(isSelect: false, typeMenu: TypeMenu.THONG_TIN_CA_NHAN),
  ContainerMenu(isSelect: false, typeMenu: TypeMenu.DANG_XUAT),
];

class ContainerMenu {
  bool isSelect;
  TypeMenu typeMenu;

  ContainerMenu({required this.isSelect, required this.typeMenu});
}