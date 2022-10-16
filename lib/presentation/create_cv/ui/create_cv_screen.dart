import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recruit_app/presentation/create_cv/bloc/create_cv_cubit.dart';
import 'package:recruit_app/presentation/create_cv/ui/widget/container_title_widget.dart';
import 'package:recruit_app/presentation/create_cv/ui/widget/pick_image_widget.dart';
import 'package:recruit_app/presentation/list_cv/ui/text_edit_controller_model.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';
import 'package:recruit_app/widget/button/button_custom.dart';
import 'package:recruit_app/widget/views/state_stream_layout.dart';

import '../../../config/base/app_exeption.dart';

class CreateCVSCreen extends StatefulWidget {
  const CreateCVSCreen({
    Key? key,
  }) : super(key: key);

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
      body: StateStreamLayout(
        stream: cubit.streamState,
        error:
            AppException(StringConst.error, StringConst.xin_vui_long_thu_lai),
        textEmpty: StringConst.empty,
        retry: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: cubit.data
                              .getRow(textEditControllerModel)
                              .map((e) => ContainerTitleWidget(
                                  controller: e.controller, title: e.key))
                              .toList(),
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
                            children: cubit.data
                                .getRowDataCurrentInfomtionJob(
                                    textEditControllerModel)
                                .map((e) => ContainerTitleWidget(
                                    controller: e.controller, title: e.key))
                                .toList()),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Ảnh chứng chỉ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        StreamBuilder<File?>(
                            stream: cubit.imageSubject.stream,
                            builder: (context, snapshot) {
                              final data = snapshot.data;
                              return GestureDetector(
                                onTap: () {
                                  if (data == null) {
                                    cubit.pickImage();
                                  }
                                },
                                child: PickImageWidget(
                                  image: data,
                                  removeImage: () {
                                    cubit.imageSubject.add(null);
                                  },
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                ),
              ),
              ButtonCustomBottom(
                  title: StringConst.tao_cv,
                  onPressed: () async {
                    await cubit.createCV(textEditControllerModel,
                        (cubit.imageSubject.value ?? File('')));
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
