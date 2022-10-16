import 'package:flutter/material.dart';
import 'package:recruit_app/until/const/color.dart';

class SelectCVItemWidget extends StatelessWidget {
  final String title;
  final String date;
  final bool isSelect;
  final Function() onTap;

  const SelectCVItemWidget(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.date,
      required this.isSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 56,
                  spreadRadius: 0,
                  color: const Color(0xFF5875AC).withOpacity(0.08)),
              BoxShadow(
                  offset: const Offset(0, 12),
                  blurRadius: 16,
                  spreadRadius: 0,
                  color: const Color(0xFF5875AC).withOpacity(0.08)),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  date,
                ),
              ],
            )),
            const SizedBox(
              width: 10,
            ),
            isSelect ? const Icon(Icons.circle, color: colorPrimary3, size: 12,) : Container()
          ],
        ),
      ),
    );
  }
}
