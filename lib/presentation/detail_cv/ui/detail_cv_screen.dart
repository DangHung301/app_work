import 'package:flutter/material.dart';
import 'package:recruit_app/domain/model/cv/detail_cv_model.dart';
import 'package:recruit_app/presentation/detail_cv/bloc/detail_cv_cubit.dart';
import 'package:recruit_app/presentation/detail_job/ui/widget/genaral_item_widget.dart';
import 'package:recruit_app/presentation/list_cv/ui/text_edit_controller_model.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';

class DetailCVScreen extends StatefulWidget {
  final String id;

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
    cubit.init();
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: StreamBuilder<DetailCVModel>(
              stream: cubit.detailCVSubject.stream,
              builder: (context, snapshot) {
                final data = snapshot.data;

                return Column(
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
                                color:
                                    const Color(0xFF5875AC).withOpacity(0.08)),
                            BoxShadow(
                                offset: const Offset(0, 12),
                                blurRadius: 16,
                                spreadRadius: 0,
                                color:
                                    const Color(0xFF5875AC).withOpacity(0.08)),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: data
                                ?.getRow(textEditControllerModel)
                                .map((e) => GenaralItemWidget(
                                    title: e.key, content: e.value))
                                .toList() ??
                            [],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Ảnh chứng chỉ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                              image: NetworkImage(data
                                      ?.currentInfmationJob.anhChungChi ??
                                  'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'))),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
