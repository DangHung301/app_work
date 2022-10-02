import 'package:flutter/material.dart';
import 'package:recruit_app/until/const/color.dart';

class ButtonCustomBottom extends StatefulWidget {
  final Color? color;
  final String title;
  final Function onPressed;
  final double? size;

  const ButtonCustomBottom({
    Key? key,
    this.color,
    required this.title,
    this.size,
    required this.onPressed,
  }) : super(key: key);

  @override
  _ButtonCustomBottomState createState() => _ButtonCustomBottomState();
}

class _ButtonCustomBottomState extends State<ButtonCustomBottom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              widget.onPressed();
            },
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: widget.color ?? colorPrimary3,
              ),
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: widget.size,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
