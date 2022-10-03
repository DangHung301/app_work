import 'package:flutter/material.dart';

class ContainerDataWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const ContainerDataWidget({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xFF3D5586),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        child,
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
