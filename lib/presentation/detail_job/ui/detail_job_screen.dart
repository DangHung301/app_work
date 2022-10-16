import 'package:flutter/material.dart';
import 'package:recruit_app/config/base/app_exeption.dart';
import 'package:recruit_app/data/response/home/detail_job_response.dart';
import 'package:recruit_app/presentation/detail_job/bloc/detail_job_cubit.dart';
import 'package:recruit_app/presentation/detail_job/ui/widget/genaral_item_widget.dart';
import 'package:recruit_app/presentation/detail_job/ui/widget/select_cv_widget.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';
import 'package:recruit_app/widget/buttom_sheet/show_bottom_sheet.dart';
import 'package:recruit_app/widget/button/button_custom.dart';
import 'package:recruit_app/widget/views/state_stream_layout.dart';

class DetailJobScreen extends StatefulWidget {
  final String id;
  final bool isApplyJob;
  const DetailJobScreen({Key? key, required this.id, this.isApplyJob = false}) : super(key: key);

  @override
  State<DetailJobScreen> createState() => _DetailJobScreenState();
}

class _DetailJobScreenState extends State<DetailJobScreen> {
  DetailJobCubit cubit = DetailJobCubit();

  @override
  void initState() {
    super.initState();
    cubit.initData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return StateStreamLayout(
      retry: () {},
      textEmpty: '',
      stream: cubit.streamState,
      error: AppException('', StringConst.xin_vui_long_thu_lai),
      child: StreamBuilder<DetailJobResponse>(
          stream: cubit.detailJob.stream,
          builder: (context, snapshot) {
            final data = snapshot.data;

            if (!snapshot.hasData) {
              return Scaffold(
                body: Container(),
              );
            }

            return Scaffold(
              backgroundColor: const Color(0xFFE5E5E5),
              appBar: BaseAppBar(
                title: StringConst.chi_tiet_cong_viec,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_rounded)),
                actions: [
                  GestureDetector(
                    onTap: () {
                      data?.savedjob = !(data.savedjob ?? false);
                      cubit.saveJob(
                          jobId: widget.id, isSave: data?.savedjob ?? false);
                      setState(() {});
                    },
                    child: data?.savedjob ?? false
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _companyWidget(nameCompany: data?.company?.name ?? ''),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _generalInfomation(
                                detailData: data ?? DetailJobResponse()),
                            const SizedBox(
                              height: 16,
                            ),
                            _companyInfomation(
                                company: data?.company ?? CompanyResponse())
                          ],
                        ),
                      ),
                    ),
                  ),
                 widget.isApplyJob ? GestureDetector(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 12,
                        ),
                        child: ButtonCustomBottom(
                          title: 'Apply',
                          onPressed: () {
                            showBottomSheetCustom(context,
                                    child: SelectCVWidget(
                                      cubit: cubit,
                                    ),
                                    title: 'Chọn CV mà bạn muốn apply')
                                .then((value) async {
                              await cubit.applyJob(
                                  cvId: value, jobId: int.parse(widget.id));
                              Navigator.pop(context);
                            });
                          },
                        )) ,
                  ): Container()
                ],
              ),
            );
          }),
    );
  }

  Widget _companyWidget({required String nameCompany}) {
    return Container(
      height: 170,
      width: double.maxFinite,
      color: Colors.grey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              cubit.fakeModel.logoCompany,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Xin chào mừng bạn đến với ',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: nameCompany,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ]))
          ],
        ),
      ),
    );
  }

  Widget _generalInfomation({required DetailJobResponse detailData}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 56,
                spreadRadius: 0,
                color: const Color(0xFF5875AC).withOpacity(0.08)),
            BoxShadow(
                offset: const Offset(0, 12),
                blurRadius: 16,
                spreadRadius: 0,
                color: const Color(0xFF5875AC).withOpacity(0.08)),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            StringConst.thong_tin_chung,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: detailData.genaralDatas
                .map((e) => GenaralItemWidget(title: e.key, content: e.value))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget _companyInfomation({required CompanyResponse company}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 56,
                spreadRadius: 0,
                color: const Color(0xFF5875AC).withOpacity(0.08)),
            BoxShadow(
                offset: const Offset(0, 12),
                blurRadius: 16,
                spreadRadius: 0,
                color: const Color(0xFF5875AC).withOpacity(0.08)),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            StringConst.thong_tin_cong_ty,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: company.companyInfomationData
                .map((e) => GenaralItemWidget(title: e.key, content: e.value))
                .toList(),
          )
        ],
      ),
    );
  }
}
