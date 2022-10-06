import 'package:flutter/material.dart';
import 'package:recruit_app/domain/model/cv/cv_model.dart';
import 'package:recruit_app/domain/model/cv/detail_cv_model.dart';
import 'package:recruit_app/presentation/create_cv/bloc/create_cv_cubit.dart';
import 'package:recruit_app/presentation/create_cv/ui/widget/container_title_widget.dart';
import 'package:recruit_app/presentation/list_cv/bloc/cv_cubit.dart';
import 'package:recruit_app/presentation/list_cv/ui/text_edit_controller_model.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/until/extension/date_time.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';
import 'package:recruit_app/widget/button/button_custom.dart';

class CreateCVSCreen extends StatefulWidget {
  final CVCubit cubit;

  const CreateCVSCreen({Key? key, required this.cubit}) : super(key: key);

  @override
  State<CreateCVSCreen> createState() => _CreateCVSCreenState();
}

class _CreateCVSCreenState extends State<CreateCVSCreen> {
  CreateCVCubit cubit = CreateCVCubit();
  TextEditControllerModel textEditControllerModel = TextEditControllerModel();

  @override
  void initState() {
    super.initState();
    cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: StringConst.tao_cv,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: StreamBuilder<DetailCVModel>(
                    stream: cubit.cvSubject.stream,
                    builder: (context, snapshot) {
                      final data = snapshot.data;

                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: data
                                      ?.getRow(textEditControllerModel)
                                      .map((e) => ContainerTitleWidget(
                                          controller: e.controller,
                                          title: e.key))
                                      .toList() ??
                                  [],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              'Thông tin công ty hiện tại',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Column(
                              children: data?.currentInfmationJob
                                      .getRowDataCurrentInfomtionJob(
                                          textEditControllerModel)
                                      .map((e) => ContainerTitleWidget(
                                          controller: e.controller,
                                          title: e.key))
                                      .toList() ??
                                  [],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            ButtonCustomBottom(
                title: StringConst.tao_cv,
                onPressed: () {
                  widget.cubit.fakeCVs.add(CVModel(
                      id: 'id',
                      title: textEditControllerModel.tieuDeCv.text,
                      dateTime: DateTime.now().formatDdMMYYYY));
                  widget.cubit.cvSubject.add(widget.cubit.fakeCVs);
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
