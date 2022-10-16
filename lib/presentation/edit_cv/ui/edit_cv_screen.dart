import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:recruit_app/domain/model/cv/detail_cv_model.dart';
import 'package:recruit_app/presentation/create_cv/ui/widget/container_title_widget.dart';
import 'package:recruit_app/presentation/create_cv/ui/widget/pick_image_widget.dart';
import 'package:recruit_app/presentation/edit_cv/bloc/edit_cv_cubit.dart';
import 'package:recruit_app/presentation/list_cv/ui/text_edit_controller_model.dart';

import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';
import 'package:recruit_app/widget/button/button_custom.dart';

class EditCVScreen extends StatefulWidget {
  const EditCVScreen({Key? key}) : super(key: key);

  @override
  State<EditCVScreen> createState() => _EditCVScreenState();
}

class _EditCVScreenState extends State<EditCVScreen> {
  EditCVCubit cubit = EditCVCubit();
  TextEditControllerModel textEditControllerModel = TextEditControllerModel();

  @override
  void initState() {
    super.initState();
    cubit.init(textEditControllerModel);

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
                      );
                    }),
              ),
            ),
            ButtonCustomBottom(
                title: 'Sửa CV',
                onPressed: () {

                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }

}
