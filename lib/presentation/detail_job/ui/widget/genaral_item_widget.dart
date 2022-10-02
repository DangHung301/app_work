import 'package:flutter/material.dart';
import 'package:recruit_app/until/const/color.dart';

class GenaralItemWidget extends StatelessWidget {
  final bool isLine;
  final String title;
  final String content;

  const GenaralItemWidget(
      {Key? key,
      this.isLine = true,
      required this.title,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: colorPrimary2),
                child: const Center(child: Icon(Icons.star),),
              )),
          const SizedBox(width: 16,),
          Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text(content, style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ), ),
                  const SizedBox(height: 10,),
                  Container(width: double.maxFinite, height: 1, color: Colors.grey,)
                ],
              ))
        ],
      ),
    );
  }
}
