import 'package:flutter/material.dart';
import 'package:recruit_app/presentation/personal_infomation/bloc/personal_infomation_cubit.dart';
import 'package:recruit_app/presentation/personal_infomation/ui/widget/birth_day_widget.dart';
import 'package:recruit_app/presentation/personal_infomation/ui/widget/container_data_widget.dart';
import 'package:recruit_app/presentation/personal_infomation/ui/widget/drop_down_gender.dart';
import 'package:recruit_app/until/const/color.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/until/extension/int.dart';
import 'package:recruit_app/widget/button/button_custom.dart';
import 'package:recruit_app/widget/dropdown/slide_show_widget.dart';
import 'package:recruit_app/widget/text_field/text_form_field.dart';

class EditInfomationScreen extends StatefulWidget {
  final PersonalInfomationCubit cubit;

  const EditInfomationScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  State<EditInfomationScreen> createState() => _EditInfomationScreenState();
}

class _EditInfomationScreenState extends State<EditInfomationScreen> {
  final nameEditController = TextEditingController();
  final emailEditController = TextEditingController();
  final dateEditController = TextEditingController();
  final genderEditController = TextEditingController();
  late DateTime date;
  late String gender;

  @override
  void initState() {
    super.initState();
    nameEditController.text =
        widget.cubit.personalInfotionSubject.value.displayname ?? '';
    emailEditController.text =
        widget.cubit.personalInfotionSubject.value.email ?? '';
    gender = widget.cubit.personalInfotionSubject.value.gender ?? '';

    date = (widget.cubit.personalInfotionSubject.value.birthday ?? 0)
        .convertToDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                ContainerDataWidget(
                    title: StringConst.ho_va_ten,
                    child: TextFormFieldWidget(
                      controller: nameEditController,
                      hintText: StringConst.ho_va_ten,
                      onChange: (value) {},
                    )),
                ContainerDataWidget(
                    title: StringConst.email,
                    child: TextFormFieldWidget(
                      controller: emailEditController,
                      hintText: StringConst.email,
                      onChange: (value) {},
                    )),
                ContainerDataWidget(
                  title: StringConst.gioi_tinh,
                  child: DropDownGender(
                      initData:
                          widget.cubit.personalInfotionSubject.value.gender,
                      items: const ['Nam', 'Nữ'],
                      onChange: (value) {
                        gender = value;
                      }),
                ),
                ContainerDataWidget(
                  title: StringConst.ngay_sinh,
                  child: SlideShowWidget(
                    child: BirthDayWidget(
                        initDate: (widget.cubit.personalInfotionSubject.value
                                    .birthday ??
                                0)
                            .convertToDateTime,
                        cubit: widget.cubit,
                        onChange: (value) {
                          date = value;
                        }),
                  ),
                ),
              ],
            ),
          )),
          Row(
            children: [
              Expanded(
                  child: ButtonCustomBottom(
                title: 'Sửa',
                onPressed: () {
                  widget.cubit.updateUserInfomation(
                      displayName: nameEditController.text,
                      email: emailEditController.text,
                      gender: gender,
                      birthday: date);
                  Navigator.pop(context);
                },
                color: colorPrimary3,
              )),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: ButtonCustomBottom(
                title: 'Đóng',
                onPressed: () {
                  Navigator.pop(context);
                },
                color: colorPrimary3,
              ))
            ],
          )
        ],
      ),
    );
  }
}
