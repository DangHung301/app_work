import 'package:flutter/material.dart';
import 'package:recruit_app/presentation/home/bloc/home_cubit.dart';
import 'package:recruit_app/presentation/home/ui/widget/job_widget.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';

class WorksScreen extends StatelessWidget {
  final HomeCubit cubit;

  const WorksScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          title: StringConst.danh_sach_cong_viec,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_outlined),
          )),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          runSpacing: 10,
          children: (cubit.jobsSubject.valueOrNull ?? [])
              .map((e) => GestureDetector(
                  onTap: () {}, child: JobWidget(nameJob: e.job, icon: e.img)))
              .toList(),
        ),
      ),
    );
  }
}
