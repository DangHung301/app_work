import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recruit_app/presentation/home/ui/home_screen.dart';
import 'package:recruit_app/presentation/list_cv/ui/list_cv_screen.dart';
import 'package:recruit_app/until/const/color.dart';

enum TabBarType { home, user }

List<TabBarType> getTabListItem() {
  return [
    TabBarType.home,
    TabBarType.user,
  ];
}

class TabBarItem {
  Widget icon;
  String text;

  TabBarItem({required this.icon, required this.text});
}

extension TabbarEnum on TabBarType {
  int get index {
    switch (this) {
      case TabBarType.home:
        return 0;
      case TabBarType.user:
        return 1;
      default:
        return 1;
    }
  }

  Widget getScreen() {
    switch (this) {
      case TabBarType.home:
        return const HomeScreen();
      case TabBarType.user:
        return const ListCVScreen();
    }
  }

  Widget getTabBarItem({
    bool isSelect = false,
  }) {
    switch (this) {
      case TabBarType.home:
        return Icon(
          Icons.home,
          color: isSelect ? colorPrimary1 : Colors.white,
        );
      case TabBarType.user:
        return Icon(
          Icons.person,
          color: isSelect ? colorPrimary1 : Colors.white,
        );
    }
  }
}

class TabScreen {
  Widget widget;
  TabBarType type;

  TabScreen({required this.widget, required this.type});
}
