import 'package:flutter/material.dart';
import 'package:recruit_app/until/const/color.dart';
import 'package:recruit_app/until/const/image.dart';
import 'package:recruit_app/widget/menu/type_menu.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(ImageAssets.imgKma, fit: BoxFit.cover),
            flex: 3,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: dataMenu
                  .map((e) => itemMenu(e.isSelect, e.typeMenu.getNameMenu, () {
                        e.typeMenu.selectMenu();
                        setState(() {});
                        Navigator.pop(context, e.typeMenu);
                      }))
                  .toList(),
            ),
            flex: 6,
          ),
        ],
      ),
    );
  }

  Widget itemMenu(bool isSelect, String name, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: isSelect ? colorPrimary3 : Colors.white,
        child: Text(
          name,
          style: TextStyle(
              color: isSelect ? Colors.white : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
