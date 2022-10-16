import 'package:flutter/material.dart';
import 'package:recruit_app/config/base/app_config.dart';
import 'package:recruit_app/data/response/home/jobs_response.dart';
import 'package:recruit_app/presentation/home/bloc/home_cubit.dart';
import 'package:recruit_app/presentation/home/ui/widget/job_company_widget.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';
import 'package:recruit_app/widget/views/state_stream_layout.dart';

import '../../../config/base/app_exeption.dart';

class JobsScreen extends StatefulWidget {
  final HomeCubit cubit;
  final JobType typeJob;

  const JobsScreen({Key? key, required this.cubit, this.typeJob = JobType.home})
      : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getJobs(type: widget.typeJob);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: widget.typeJob.getTile,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: StateStreamLayout(
        retry: () {},
        textEmpty: '',
        stream: widget.cubit.streamState,
        error: AppException('', StringConst.xin_vui_long_thu_lai),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _searchBar(onChange: (text) {
                  widget.cubit.searchJobs(search: text, type: JobType.apply);
                }),
                const SizedBox(
                  height: 20,
                ),
                _congViec(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchBar({required Function(String text) onChange}) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        width: sizeScreen(context).width * 0.75,
        height: 50,
        child: TextField(
          onChanged: onChange,
          textAlign: TextAlign.start,
          maxLines: 1,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Tìm việc làm ngay',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(30),
            ),
            isDense: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }

  Widget _congViec() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          StringConst.cong_viec,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        StreamBuilder<JobsResponse>(
            stream: widget.cubit.companysSubject.stream,
            builder: (context, snapshot) {
              final data = snapshot.data;
              if (!snapshot.hasData) {
                return Container();
              }
              return SingleChildScrollView(
                child: Column(
                  children: (data?.items ?? []).isNotEmpty
                      ? (data?.items ?? [])
                          .map((e) => JobCompanyWidget(
                                type: widget.typeJob,
                                image:
                                    'https://webixytech.com/admin_panel/assets/project_images/1625120256What_is_an_IT_company.jpg',
                                title: e.name ?? '',
                                rangeSalary: e.salary ?? '',
                                address: e.workaddress ?? '',
                                id: e.id ?? '',
                                thenPop: (value) {
                                  widget.cubit.getJobs(type: widget.typeJob);
                                },
                              ))
                          .toList()
                      : [const Center(child: Text('Không có dữ liệu'))],
                ),
              );
            })
      ],
    );
  }
}
