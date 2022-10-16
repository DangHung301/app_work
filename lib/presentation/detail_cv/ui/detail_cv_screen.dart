import 'package:flutter/material.dart';
import 'package:recruit_app/data/response/cv/detail_cv_response.dart';
import 'package:recruit_app/presentation/detail_cv/bloc/detail_cv_cubit.dart';
import 'package:recruit_app/presentation/detail_job/ui/widget/genaral_item_widget.dart';
import 'package:recruit_app/presentation/list_cv/ui/text_edit_controller_model.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';
import 'package:recruit_app/widget/views/state_stream_layout.dart';

import '../../../config/base/app_exeption.dart';
import '../../../until/const/api_const.dart';

class DetailCVScreen extends StatefulWidget {
  final int id;

  const DetailCVScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailCVScreen> createState() => _DetailCVScreenState();
}

class _DetailCVScreenState extends State<DetailCVScreen> {
  final DetailCVCubit cubit = DetailCVCubit();

  final TextEditControllerModel textEditControllerModel =
      TextEditControllerModel();

  @override
  void initState() {
    super.initState();
    cubit.init(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return StateStreamLayout(
      stream: cubit.streamState,
      error: AppException(StringConst.error, StringConst.xin_vui_long_thu_lai),
      textEmpty: StringConst.empty,
      retry: () {},
      child: StreamBuilder<DetailCvResponse>(
          stream: cubit.detailCVSubject.stream,
          builder: (context, snapshot) {
            final data = snapshot.data;

            if (!snapshot.hasData) {
              return Scaffold(
                appBar: BaseAppBar(
                  title: StringConst.chi_tiet_cv,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_sharp),
                  ),
                ),
                body: Container(),
              );
            }

            return Scaffold(
              backgroundColor: const Color(0xFFE5E5E5),
              appBar: BaseAppBar(
                title: StringConst.chi_tiet_cv,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_sharp),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      cubit.addPrimary(widget.id);
                    },
                    child: (data?.isprimary ?? false)
                        ? const Icon(
                            Icons.star,
                            color: Colors.amber,
                          )
                        : const Icon(Icons.star_border),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              body: Container(
                margin: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 56,
                                  spreadRadius: 0,
                                  color: const Color(0xFF5875AC)
                                      .withOpacity(0.08)),
                              BoxShadow(
                                  offset: const Offset(0, 12),
                                  blurRadius: 16,
                                  spreadRadius: 0,
                                  color: const Color(0xFF5875AC)
                                      .withOpacity(0.08)),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Thông tin cá nhân',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Column(
                              children: data
                                      ?.getRow(textEditControllerModel)
                                      .map((e) => GenaralItemWidget(
                                          title: e.key, content: e.value))
                                      .toList() ??
                                  [],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 56,
                                  spreadRadius: 0,
                                  color: const Color(0xFF5875AC)
                                      .withOpacity(0.08)),
                              BoxShadow(
                                  offset: const Offset(0, 12),
                                  blurRadius: 16,
                                  spreadRadius: 0,
                                  color: const Color(0xFF5875AC)
                                      .withOpacity(0.08)),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Thông tin công ty hiện tại',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Column(
                              children: data
                                      ?.getRowDataCurrentInfomtionJob(
                                          textEditControllerModel)
                                      .map((e) => GenaralItemWidget(
                                          title: e.key, content: e.value))
                                      .toList() ??
                                  [],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      (data?.certificatephoto ?? '').isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Ảnh chứng chỉ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  height: 200,
                                  margin: const EdgeInsets.only(bottom: 6),
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              '$url/${data!.certificatephoto!}'))),
                                )
                              ],
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
