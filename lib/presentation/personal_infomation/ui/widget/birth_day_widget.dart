import 'package:flutter/cupertino.dart';
import 'package:recruit_app/presentation/personal_infomation/bloc/personal_infomation_cubit.dart';
import 'package:recruit_app/until/const/color.dart';
import 'package:recruit_app/until/extension/date_time.dart';

class BirthDayWidget extends StatefulWidget {
  final PersonalInfomationCubit cubit;
  final Function(DateTime value) onChange;
  final DateTime? initDate;

  const BirthDayWidget({
    Key? key,
    required this.onChange,
    required this.cubit,
    this.initDate,
  }) : super(key: key);

  @override
  State<BirthDayWidget> createState() => _BirthDayWidgetState();
}

class _BirthDayWidgetState extends State<BirthDayWidget> {
  bool isShowDateTime = false;

  @override
  void initState() {
    super.initState();
    if (widget.initDate != null) {
      widget.cubit.birthDaySubject.add(widget.initDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder<DateTime>(
          stream: widget.cubit.birthDaySubject.stream,
          builder: (context, snapshot) {
            final data = snapshot.data ?? DateTime.now();
            return GestureDetector(
              onTap: () {
                isShowDateTime = !isShowDateTime;
                setState(() {});
              },
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colorE2E8F0,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  data.formatDdMMYYYY,
                  style: const TextStyle(color: color304261, fontSize: 14),
                ),
              ),
            );
          },
        ),
        if (isShowDateTime)
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              minimumYear: 1950,
              initialDateTime: widget.initDate,
              maximumDate: DateTime(DateTime.now().year + 50),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime value) {
                widget.cubit.birthDaySubject.add(value);
                widget.onChange(value);
              },
            ),
          )
        else
          Container(),
      ],
    );
  }
}
