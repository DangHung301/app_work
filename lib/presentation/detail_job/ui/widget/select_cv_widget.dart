import 'package:flutter/material.dart';
import 'package:recruit_app/config/base/app_config.dart';
import 'package:recruit_app/presentation/detail_job/bloc/detail_job_cubit.dart';
import 'package:recruit_app/presentation/detail_job/ui/widget/select_cv_item_widget.dart';
import 'package:recruit_app/until/extension/date_time.dart';
import 'package:recruit_app/until/extension/string.dart';
import 'package:recruit_app/widget/button/button_custom.dart';
import 'package:recruit_app/widget/dialog/message_config/message_config.dart';

class SelectCVWidget extends StatefulWidget {
  final DetailJobCubit cubit;

  const SelectCVWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<SelectCVWidget> createState() => _SelectCVWidgetState();
}

class _SelectCVWidgetState extends State<SelectCVWidget> {
  int cvId = 0;

  bool get isSelect {
    for (var e in widget.cubit.cvSubject.value) {
      if (e.isSelect == true) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeScreen(context).height * 0.8,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder<List<SelectCV>>(
                stream: widget.cubit.cvSubject.stream,
                builder: (context, snapshot) {
                  final data = snapshot.data ?? [];

                  return SingleChildScrollView(
                    child: Column(
                      children: data
                          .map((e) => SelectCVItemWidget(
                              onTap: () {
                                widget.cubit.selectCV(e);
                                cvId = e.value.id ?? 0;
                              },
                              title: e.value.title ?? '',
                              date: (e.value.createdat ?? '')
                                  .convertStringToDate
                                  .formatDdMMYYYY,
                              isSelect: e.isSelect))
                          .toList(),
                    ),
                  );
                }),
          ),
          ButtonCustomBottom(
              title: 'Chọn CV',
              onPressed: () {
                if (isSelect) {
                  Navigator.pop(context, cvId);
                } else {
                  MessageConfig.show(
                      title: 'Vui lòng chọn CV', messState: MessState.error);
                }
              }),
        ],
      ),
    );
  }
}
