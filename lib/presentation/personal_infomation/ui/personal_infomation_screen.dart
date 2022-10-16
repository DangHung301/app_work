import 'package:flutter/material.dart';
import 'package:recruit_app/data/response/login_response/login_response.dart';
import 'package:recruit_app/presentation/detail_job/ui/widget/genaral_item_widget.dart';
import 'package:recruit_app/presentation/personal_infomation/bloc/personal_infomation_cubit.dart';
import 'package:recruit_app/presentation/personal_infomation/ui/edit_infomation_screen.dart';
import 'package:recruit_app/until/const/color.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';
import 'package:recruit_app/widget/buttom_sheet/show_bottom_sheet.dart';
import 'package:recruit_app/widget/views/state_stream_layout.dart';

import '../../../config/base/app_exeption.dart';

class PersonalInfomationScreen extends StatefulWidget {
  const PersonalInfomationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfomationScreen> createState() =>
      _PersonalInfomationScreenState();
}

class _PersonalInfomationScreenState extends State<PersonalInfomationScreen> {
  PersonalInfomationCubit cubit = PersonalInfomationCubit();

  @override
  void initState() {
    super.initState();
    cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      floatingActionButton: GestureDetector(
        onTap: () {
          showBottomSheetCustom(context,
              title: StringConst.sua_thong_tin_ca_nhan,
              child: EditInfomationScreen(
                cubit: cubit,
              )).then((value) {
            cubit.init();
          });
        },
        child: Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: colorPrimary3),
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            )),
      ),
      appBar: BaseAppBar(
        title: StringConst.thong_tin_ca_nhan,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_sharp)),
      ),
      body: StateStreamLayout(
        stream: cubit.streamState,
        error:
            AppException(StringConst.error, StringConst.xin_vui_long_thu_lai),
        textEmpty: StringConst.empty,
        retry: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 8,
          ),
          child: StreamBuilder<UserResponse>(
              stream: cubit.personalInfotionSubject.stream,
              builder: (context, snapshot) {
                final data = snapshot.data;

                if (!snapshot.hasData) {
                  return Container();
                }

                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: data
                            ?.rowInfomation()
                            .map((e) => GenaralItemWidget(
                                title: e.key, content: e.value))
                            .toList() ??
                        [],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
