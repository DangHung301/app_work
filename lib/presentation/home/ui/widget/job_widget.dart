import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobWidget extends StatelessWidget {
  final String nameJob;
  final Icon icon;

  const JobWidget({Key? key, required this.nameJob, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 80),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(
            height: 4,
          ),
          Text(
            nameJob,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
