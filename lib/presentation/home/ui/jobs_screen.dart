import 'package:flutter/material.dart';
import 'package:recruit_app/config/base/app_config.dart';
import 'package:recruit_app/domain/model/home_screen/company_model.dart';
import 'package:recruit_app/presentation/home/bloc/home_cubit.dart';
import 'package:recruit_app/presentation/home/ui/widget/job_company_widget.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';

class JobsScreen extends StatefulWidget {
  final HomeCubit cubit;

  const JobsScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Danh sách công việc',
        leading: GestureDetector(
            onTap: () {

              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
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
              _congViec(),
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
        StreamBuilder<List<CompanyModel>>(
            stream: widget.cubit.companysSubject.stream,
            builder: (context, snapshot) {
              final data = snapshot.data ?? [];

              return SingleChildScrollView(
                child: Column(
                  children: data
                      .map((e) => JobCompanyWidget(
                            image: e.logoImage,
                            title: e.title,
                            rangeSalary: e.rangeSalary,
                            address: e.address,
                            id: '',
                          ))
                      .toList(),
                ),
              );
            })
      ],
    );
  }
}
