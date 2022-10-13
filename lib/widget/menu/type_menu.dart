import 'package:flutter/material.dart';
import 'package:recruit_app/config/base/di.dart';
import 'package:recruit_app/config/local/prefs_service.dart';
import 'package:recruit_app/presentation/home/bloc/home_cubit.dart';
import 'package:recruit_app/presentation/home/ui/jobs_screen.dart';
import 'package:recruit_app/presentation/login/ui/login_screen.dart';
import 'package:recruit_app/presentation/personal_infomation/ui/personal_infomation_screen.dart';
import 'package:recruit_app/presentation/tabbar_screen/bloc/main_cubit.dart';
import 'package:recruit_app/presentation/tabbar_screen/ui/tabbar_item.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/dialog/show_dialog.dart';

enum TypeMenu {
  TRANG_CHU,
  DANH_SACH_CONG_VIEC_DA_LUU,
  DANH_SACH_CONG_VIEC_DA_UNG_TUYEN,
  THONG_TIN_CA_NHAN,
  DANG_XUAT
}

extension ExtensionTypeMenu on TypeMenu {
  String get getNameMenu {
    switch (this) {
      case TypeMenu.TRANG_CHU:
        return StringConst.trang_chu;
      case TypeMenu.DANH_SACH_CONG_VIEC_DA_LUU:
        return StringConst.danh_sach_cong_viec_da_luu;
      case TypeMenu.DANH_SACH_CONG_VIEC_DA_UNG_TUYEN:
        return StringConst.danh_sach_cong_viec_da_ung_tuyen;
      case TypeMenu.THONG_TIN_CA_NHAN:
        return StringConst.thong_tin_ca_nhan;
      case TypeMenu.DANG_XUAT:
        return StringConst.dang_xuat;
    }
  }

  void selectMenu() {
    for (ContainerMenu e in dataMenu) {
      if (this == e.typeMenu) {
        e.isSelect = true;
      } else {
        e.isSelect = false;
      }
    }
  }

  void navigatorScreen(BuildContext context) {
    switch (this) {
      case TypeMenu.TRANG_CHU:
        {
          getIt<MainCubit>().selectTab(TabBarType.home);
          Navigator.pop(context);
          break;
        }
      case TypeMenu.DANH_SACH_CONG_VIEC_DA_LUU:
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => JobsScreen(cubit: HomeCubit())));
          break;
        }
      case TypeMenu.DANH_SACH_CONG_VIEC_DA_UNG_TUYEN:
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => JobsScreen(cubit: HomeCubit())));
          break;
        }
      case TypeMenu.THONG_TIN_CA_NHAN:
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PersonalInfomationScreen()));
          break;
        }
      case TypeMenu.DANG_XUAT:
        {
          PrefsService.removeToken();

          showMyDialog(
              context: context,
              title: 'Đăng xuất',
              content: 'Bạn có muốn đăng xuất không',
              onPress: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()), (_) => false);
              });
          break;
        }
    }
  }
}

void selectHomeMenu() {
  for (ContainerMenu e in dataMenu) {
    if (TypeMenu.TRANG_CHU == e.typeMenu) {
      e.isSelect = true;
    } else {
      e.isSelect = false;
    }
  }
}

List<ContainerMenu> dataMenu = [
  ContainerMenu(isSelect: true, typeMenu: TypeMenu.TRANG_CHU),
  ContainerMenu(isSelect: false, typeMenu: TypeMenu.DANH_SACH_CONG_VIEC_DA_LUU),
  ContainerMenu(
      isSelect: false, typeMenu: TypeMenu.DANH_SACH_CONG_VIEC_DA_UNG_TUYEN),
  ContainerMenu(isSelect: false, typeMenu: TypeMenu.THONG_TIN_CA_NHAN),
  ContainerMenu(isSelect: false, typeMenu: TypeMenu.DANG_XUAT),
];

class ContainerMenu {
  bool isSelect;
  TypeMenu typeMenu;

  ContainerMenu({required this.isSelect, required this.typeMenu});
}
