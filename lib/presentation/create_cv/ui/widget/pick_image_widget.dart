import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recruit_app/until/const/color.dart';
import 'package:recruit_app/until/const/image.dart';

class PickImageWidget extends StatefulWidget {
  final File? image;
  final Function removeImage;

  const PickImageWidget({
    Key? key,
    required this.image,
    required this.removeImage,
  }) : super(key: key);

  @override
  State<PickImageWidget> createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  void removeImg() {
    widget.removeImage();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.image == null ? _emptyImage() : imageWidget();
  }

  Widget _emptyImage() {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 6),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color(0xFFE5E5E5),
          borderRadius: BorderRadius.circular(12),),

      child:  const Center(
        child: Icon(Icons.add),
      ),
    );
  }

  Widget imageWidget() {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorDBDFEF.withOpacity(0.5)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(widget.image ?? File('')),
            ),
            boxShadow: [
              BoxShadow(
                color: color6566E9.withOpacity(0.05),
                offset: const Offset(0, 4),
                blurRadius: 10,
              )
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {
              removeImg();
            },
            child: SvgPicture.asset(ImageAssets.icRemoveImg),
          ),
        )
      ],
    );
  }
}
