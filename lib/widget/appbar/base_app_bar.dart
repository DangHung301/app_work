import 'package:flutter/material.dart';
import 'package:recruit_app/until/const/color.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final List<Widget>? actions;
  final Widget? leading;
  final String title;
  final bool centerTitle;

  const BaseAppBar(
      {Key? key,
      this.actions,
      this.leading,
      required this.title,
      this.centerTitle = false})
      :  preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      leading: leading,
      backgroundColor: colorPrimary3,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: centerTitle,

    );
  }
}
