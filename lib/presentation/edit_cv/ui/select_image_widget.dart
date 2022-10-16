import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recruit_app/until/const/color.dart';
import 'package:recruit_app/until/const/image.dart';

import '../../../../until/const/api_const.dart';

class SelectImageWidget extends StatefulWidget {
  final String? imageUrl;
  final Function(File image) callBackImageFile;

  const SelectImageWidget({
    Key? key,
    this.imageUrl,
    required this.callBackImageFile,
  }) : super(key: key);

  @override
  State<SelectImageWidget> createState() => _SelectImageWidgetState();
}

class _SelectImageWidgetState extends State<SelectImageWidget> {
  String imageUrl = '';
  File? imageFile;

  @override
  void didUpdateWidget(SelectImageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    imageUrl = widget.imageUrl ?? '';
  }

  void removeImg() {
    imageFile = null;
    setState(() {});
  }

  void removeImgUrl() {
    imageUrl = '';
    setState(() {});
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFile = File(image.path);
      widget.callBackImageFile(imageFile!);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isNotEmpty) {
      return imageUrlWidget();
    } else {
      if (imageFile == null) {
        return _emptyImage();
      } else {
        return imageWidget();
      }
    }
  }

  Widget _emptyImage() {
    return GestureDetector(
      onTap: () {
        pickImage();
      },
      child: Container(
        height: 200,
        margin: const EdgeInsets.only(bottom: 6),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: const Color(0xFFE5E5E5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Icon(Icons.add),
        ),
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
              image: FileImage(imageFile ?? File('')),
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

  Widget imageUrlWidget() {
    return Stack(
      children: [
        Container(
          height: 200,
          margin: const EdgeInsets.only(bottom: 6),
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage('$url/$imageUrl'))),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {
              removeImgUrl();
            },
            child: SvgPicture.asset(ImageAssets.icRemoveImg),
          ),
        )
      ],
    );
  }
}
