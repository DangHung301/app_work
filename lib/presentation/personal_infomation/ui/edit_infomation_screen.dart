import 'package:flutter/material.dart';
import 'package:recruit_app/presentation/personal_infomation/bloc/personal_infomation_cubit.dart';
import 'package:recruit_app/presentation/personal_infomation/ui/widget/birth_day_widget.dart';
import 'package:recruit_app/presentation/personal_infomation/ui/widget/container_data_widget.dart';
import 'package:recruit_app/presentation/personal_infomation/ui/widget/drop_down_gender.dart';
import 'package:recruit_app/until/const/color.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/until/extension/date_time.dart';
import 'package:recruit_app/until/extension/string.dart';
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
  final ageEditController = TextEditingController();
  final dateEditController = TextEditingController();
  final genderEditController = TextEditingController();
  late DateTime date;
  late String gender;

  @override
  void initState() {
    super.initState();
    nameEditController.text = widget.cubit.personalInfotionSubject.value.name;
    ageEditController.text =
        widget.cubit.personalInfotionSubject.value.age.toString();
    gender = widget.cubit.fakeData.gender;
    date = widget.cubit.fakeData.date.convertStringToDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.7,
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
                        title: StringConst.tuoi,
                        child: TextFormFieldWidget(
                          controller: ageEditController,
                          hintText: StringConst.tuoi,
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
                            initDate: widget.cubit.personalInfotionSubject.value
                                .date.convertStringToDate,
                            cubit: widget.cubit,
                            onChange: (value) {date = value;}),
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
                      widget.cubit.fakeData.name = nameEditController.text;
                      widget.cubit.fakeData.age =
                          int.parse(ageEditController.text);
                      widget.cubit.fakeData.gender = gender;
                      widget.cubit.fakeData.date = date.formatDdMMYYYY;
                      widget.cubit.personalInfotionSubject.add(widget.cubit.fakeData);
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
