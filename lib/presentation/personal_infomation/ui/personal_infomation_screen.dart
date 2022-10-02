import 'package:flutter/material.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';

class PersonalInfomationScreen extends StatefulWidget {
  const PersonalInfomationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfomationScreen> createState() => _PersonalInfomationScreenState();
}

class _PersonalInfomationScreenState extends State<PersonalInfomationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: StringConst.thong_tin_ca_nhan,
      ),
    );
  }
}
