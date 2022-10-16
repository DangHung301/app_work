import 'package:flutter/material.dart';
import 'package:recruit_app/config/base/app_config.dart';
import 'package:recruit_app/data/response/home/jobs_response.dart';
import 'package:recruit_app/data/response/home/name_jobs_response.dart';
import 'package:recruit_app/presentation/home/bloc/home_cubit.dart';
import 'package:recruit_app/presentation/home/ui/jobs_screen.dart';
import 'package:recruit_app/presentation/home/ui/widget/job_company_widget.dart';
import 'package:recruit_app/presentation/home/ui/widget/job_widget.dart';
import 'package:recruit_app/presentation/home/ui/works_screen.dart';
import 'package:recruit_app/until/const/color.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';
import 'package:recruit_app/widget/drawer/drawer_slide.dart';
import 'package:recruit_app/widget/menu/menu.dart';
import 'package:recruit_app/widget/views/state_stream_layout.dart';

import '../../../config/base/app_exeption.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeCubit cubit = HomeCubit();

  @override
  void initState() {
    super.initState();
    cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: StringConst.home,
        leading: GestureDetector(
            onTap: () {
              DrawerSlide.navigatorSlide(
                  context: context, screen: const MenuWidget());
            },
            child: const Icon(Icons.menu)),
      ),
      body: StateStreamLayout(
        stream: cubit.streamState,
        error:
            AppException(StringConst.error, StringConst.xin_vui_long_thu_lai),
        textEmpty: StringConst.empty,
        retry: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _searchBar(onChange: (text) {
                  cubit.searchJobs(search: text);
                }),
                const SizedBox(
                  height: 20,
                ),
                _danhSachCongViec(),
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

  Widget _danhSachCongViec() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              StringConst.danh_sach_cong_viec,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WorksScreen(cubit: cubit)));
              },
              child: const Icon(
                Icons.navigate_next,
                color: colorPrimary1,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        StreamBuilder<List<NameJobsResponse>>(
            stream: cubit.jobsSubject.stream,
            builder: (context, snapshot) {
              final data = snapshot.data ?? [];

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: data
                      .map((e) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JobsScreen(
                                          cubit: cubit,
                                          careerId: int.parse(e.id ?? ''),
                                        ))).then((value) {
                                          cubit.companysSubject.add(JobsResponse()); /// clear data
                              cubit.init();
                            });
                          },
                          child: JobWidget(
                              nameJob: e.details ?? '',
                              icon: const Icon(
                                Icons.star,
                                color: colorPrimary1,
                              ))))
                      .toList(),
                ),
              );
            })
      ],
    );
  }

  Widget _congViec() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              StringConst.cong_viec,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JobsScreen(cubit: cubit)));
              },
              child: const Icon(
                Icons.navigate_next,
                color: colorPrimary1,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        StreamBuilder<JobsResponse>(
            stream: cubit.companysSubject.stream,
            builder: (context, snapshot) {
              final data = snapshot.data;

              return SingleChildScrollView(
                child: Column(
                  children: (data?.items ?? [])
                      .map((e) => JobCompanyWidget(
                            image:
                                'https://webixytech.com/admin_panel/assets/project_images/1625120256What_is_an_IT_company.jpg',
                            title: e.name ?? '',
                            rangeSalary: e.salary ?? '',
                            address: e.workaddress ?? '',
                            id: e.id ?? '',
                            thenPop: (value) {
                              cubit.init();
                            },
                          ))
                      .toList(),
                ),
              );
            })
      ],
    );
  }
}
