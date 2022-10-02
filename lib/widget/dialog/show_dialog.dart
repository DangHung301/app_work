import 'package:flutter/material.dart';

Future<void> showMyDialog({
  required BuildContext context,
  required String title,
  required String content,
  required Function() onPress,
}) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          content: Text(
            content,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onPress();
                // Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      });
}
