import 'package:flutter/material.dart';
import 'package:recruit_app/config/base/app_config.dart';
import 'package:recruit_app/domain/model/home_screen/company_model.dart';
import 'package:recruit_app/domain/model/home_screen/job_model.dart';
import 'package:recruit_app/presentation/home/bloc/home_cubit.dart';
import 'package:recruit_app/presentation/home/ui/jobs_screen.dart';
import 'package:recruit_app/presentation/home/ui/widget/job_company_widget.dart';
import 'package:recruit_app/presentation/home/ui/widget/job_widget.dart';
import 'package:recruit_app/until/const/color.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';
import 'package:recruit_app/widget/drawer/drawer_slide.dart';
import 'package:recruit_app/widget/menu/menu.dart';

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
                  context: context,
                  screen: const MenuWidget());
            },
            child: const Icon(Icons.menu)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchBar(onChange: (text) {}),
              const SizedBox(
                height: 20,
              ),
              _danhSachCongViec(),
              const SizedBox(
                height: 20,
              ),
              _congViec(onTap: () {

              }),
              const SizedBox(
                height: 20,
              ),
            ],
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
        const Text(
          StringConst.danh_sach_cong_viec,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        StreamBuilder<List<JobModel>>(
            stream: cubit.jobsSubject.stream,
            builder: (context, snapshot) {
              final data = snapshot.data ?? [];

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: data
                      .map((e) => JobWidget(nameJob: e.job, icon: e.img))
                      .toList(),
                ),
              );
            })
      ],
    );
  }

  Widget _congViec({required Function() onTap}) {
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => JobsScreen(cubit: cubit)));

              },
              child: const Icon(Icons.navigate_next, color: colorPrimary1,),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        StreamBuilder<List<CompanyModel>>(
            stream: cubit.companysSubject.stream,
            builder: (context, snapshot) {
              final data = snapshot.data ?? [];

              return SingleChildScrollView(
                child: Column(
                  children: data
                      .map((e) => GestureDetector(
                    onTap: onTap,
                        child: JobCompanyWidget(
                            image: e.logoImage,
                            title: e.title,
                            rangeSalary: e.rangeSalary,
                            address: e.address),
                      ))
                      .toList(),
                ),
              );
            })
      ],
    );
  }
}
