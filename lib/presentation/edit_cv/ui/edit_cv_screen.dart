import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recruit_app/presentation/create_cv/ui/widget/container_title_widget.dart';
import 'package:recruit_app/presentation/edit_cv/bloc/edit_cv_cubit.dart';
import 'package:recruit_app/presentation/edit_cv/ui/select_image_widget.dart';

import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';
import 'package:recruit_app/widget/button/button_custom.dart';
import 'package:recruit_app/widget/views/state_stream_layout.dart';

import '../../../config/base/app_exeption.dart';
import '../../../data/response/cv/detail_cv_response.dart';

class EditCVScreen extends StatefulWidget {
  final String id;

  const EditCVScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<EditCVScreen> createState() => _EditCVScreenState();
}

class _EditCVScreenState extends State<EditCVScreen> {
  EditCVCubit cubit = EditCVCubit();
  File fileImage = File('');
  @override
  void initState() {
    super.initState();
    cubit.initData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: 'Sửa CV',
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
                  child: StreamBuilder<DetailCvResponse>(
                      stream: cubit.cvSubject.stream,
                      builder: (context, snapshot) {
                        final data = snapshot.data;

                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: data
                                        ?.getRow(cubit.textEditControllerModel)
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
                                children: data
                                        ?.getRowDataCurrentInfomtionJob(
                                            cubit.textEditControllerModel)
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

                              SelectImageWidget(
                                callBackImageFile: (File fileImage) {
                                  this.fileImage = fileImage;
                                },
                                imageUrl: data
                                    ?.certificatephoto,
                              )

                              // StreamBuilder<File?>(
                              //     stream: cubit.imageSubject.stream,
                              //     builder: (context, snapshot) {
                              //       final dataFile = snapshot.data;
                              //       return GestureDetector(
                              //         onTap: () {
                              //           if (data == null) {
                              //             cubit.pickImage();
                              //           }
                              //         },
                              //         child: PickImageWidget(
                              //           image: dataFile,
                              //           imageUrl: data?.certificatephoto,
                              //           removeImage: () {
                              //             cubit.imageSubject.add(null);
                              //           },
                              //         ),
                              //       );
                              //     })
                            ],
                          ),
                        );
                      }),
                ),
              ),
              ButtonCustomBottom(
                  title: 'Sửa CV',
                  onPressed: () async {
                    await cubit.editCV(
                        image: fileImage,
                        id: int.parse(widget.id));
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
