import 'package:flutter/material.dart';
import 'package:recruit_app/widget/text_field/text_form_field.dart';

class ContainerTitleWidget extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  const ContainerTitleWidget(
      {Key? key, required this.controller, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormFieldWidget(
            hintText: title,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
