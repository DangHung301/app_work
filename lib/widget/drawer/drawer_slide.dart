import 'package:flutter/material.dart';
import 'package:recruit_app/config/base/di.dart';
import 'package:recruit_app/presentation/tabbar_screen/bloc/main_cubit.dart';
import 'package:recruit_app/presentation/tabbar_screen/ui/tabbar_item.dart';
import 'package:recruit_app/widget/menu/type_menu.dart';

class DrawerSlide {
  static void navigatorSlide({
    required BuildContext context,
    required Widget screen,
    bool isLeft = true,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        reverseTransitionDuration: const Duration(milliseconds: 250),
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, animation, ___) {
          final Offset begin;
          if (isLeft) {
            begin = const Offset(-1.0, 0.0);
          } else {
            begin = const Offset(1.0, 0.0);
          }
          const end = Offset.zero;
          final tween = Tween(end: end, begin: begin);
          final offsetAnimation = animation.drive(tween);

          return Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      color: Colors.black12,
                      child: SlideTransition(
                        position: offsetAnimation,
                        child: screen,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      child: Container(color: Colors.black12),
                      onTap: () {
                        // getIt<MainCubit>().selectTab(TabBarType.home);
                        selectHomeMenu();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              )
            ],
          );

        },
        opaque: false,
      ),
    ).then((value) {
    });
  }
}
