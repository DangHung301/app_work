import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  final String? message;

  const EmptyView({Key? key,this.message,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? 'Không có dữ liệu',
        style: const TextStyle(color: Color(0xFF303742), fontSize: 16),
      ),
    );
  }
}
