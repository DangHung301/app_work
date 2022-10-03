import 'package:flutter/material.dart';

Future<T?> showBottomSheetCustom<T>(BuildContext context,
    {required Widget child, required String title}) {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
    clipBehavior: Clip.hardEdge,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          lineContainer(),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, color: Color(0xff3D5586)),
                ),
                child
              ],
            ),
          )
        ],
      );
    },
  );
}

Widget lineContainer() {
  return Container(
    height: 6,
    width: 48,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color(0xFFECEEF7),
    ),
  );
}
