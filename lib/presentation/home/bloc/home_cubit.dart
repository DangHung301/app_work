import 'dart:async';

import 'package:get/get.dart';
import 'package:recruit_app/config/base/base_cubit.dart';
import 'package:recruit_app/data/request/home/job_request.dart';
import 'package:recruit_app/data/response/home/jobs_response.dart';
import 'package:recruit_app/data/response/home/name_jobs_response.dart';
import 'package:recruit_app/domain/model/home_screen/company_model.dart';
import 'package:recruit_app/domain/repositories/repo/home/home_repository.dart';
import 'package:recruit_app/presentation/home/bloc/home_state.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/result.dart';

enum JobType { apply, save, home }

extension ExtensionJob on JobType {
  String get getTile {
    switch (this) {
      case JobType.home:
        return 'Danh sách công việc';
      case JobType.save:
        return 'Danh sách công việc đã lưu';
      case JobType.apply:
        return 'Danh sách công việc đã ứng tuyển';
    }
  }
}

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(HomeStateIntial());

  HomeRepository repo = Get.find();

  List<JobDataResponse> saveData = [];

  BehaviorSubject<List<NameJobsResponse>> jobsSubject =
      BehaviorSubject<List<NameJobsResponse>>();

  BehaviorSubject<JobsResponse> companysSubject =
      BehaviorSubject<JobsResponse>();

  Future<void> init() async {
    showLoading();

    await Future.wait([getNameJobs(), getJobs()]);

    showContent();
  }

  Future<void> searchJobs({
    String search = '',
    JobType type = JobType.home,
  }) async {
    Timer(const Duration(milliseconds: 500), () async {
      if (type == JobType.home) {
        showLoading();
        await getJobs(search: search);
        showContent();
      } else {
        if(search.trim().isNotEmpty) {
          companysSubject.value.items = (saveData )
              .where((element) => (element.name ?? '').contains(search))
              .toList();
        } else {
          companysSubject.value.items = saveData;
        }

        companysSubject.add(companysSubject.value);
      }
    });
  }

  Future<void> getNameJobs() async {
    final result = await repo.getNameJobs();

    result.when(
        success: (success) {
          jobsSubject.add(success);
        },
        error: (error) {});
  }

  Future<void> getJobs(
      {String search = '',
      int page = 1,
      int size = 10,
      JobType type = JobType.home, int? careerId}) async {
    late Result<JobsResponse> result;
    showLoading();
    if (type == JobType.apply) {
      result = await repo.getJobsApplied();
    } else if (type == JobType.save) {
      result = await repo.getJobsSaved();
    } else {
      result = await repo
          .getJobs(JobRequest(page: page, size: size, search: search, careerId: careerId));
    }

    result.when(
        success: (success) {
          saveData = success.items  ?? [];
          companysSubject.add(success);
        },
        error: (error) {});
    showContent();
  }

  List<CompanyModel> companys = [
    CompanyModel(
        logoImage:
            'https://c8.alamy.com/comp/PXPBDW/building-logo-design-real-estate-company-logo-design-abstract-construction-logo-design-building-logo-design-PXPBDW.jpg',
        title: 'Công ty Cổ phần Chứng khoán Thành phố Hồ Chí Minh (HSC)',
        rangeSalary: '6tr - 8tr',
        address: 'Ha noi'),
    CompanyModel(
        logoImage:
            'https://static8.depositphotos.com/1378583/1010/i/600/depositphotos_10108949-stock-photo-blue-flame-logo.jpg',
        title: 'Hi-res',
        rangeSalary: '6tr - 8tr',
        address: 'Ha noi'),
    CompanyModel(
        logoImage:
            'https://img.freepik.com/free-vector/abstract-logo-flame-shape_1043-44.jpg?w=2000',
        title: 'Hi-res',
        rangeSalary: '6tr - 8tr',
        address: 'Ha noi'),
    CompanyModel(
        logoImage:
            'https://i.pinimg.com/736x/48/fd/ed/48fded5d395b8eea026c57244587c755.jpg',
        title: 'Hi-res',
        rangeSalary: '6tr - 8tr',
        address: 'Ha noi'),
    CompanyModel(
        logoImage:
            'https://c8.alamy.com/comp/PXPBDW/building-logo-design-real-estate-company-logo-design-abstract-construction-logo-design-building-logo-design-PXPBDW.jpg',
        title: 'Hi-res',
        rangeSalary: '6tr - 8tr',
        address: 'Ha noi'),
    CompanyModel(
        logoImage:
            'https://seeklogo.com/images/A/abstract-logo-CBFB9AEDD8-seeklogo.com.png',
        title: 'Hi-res',
        rangeSalary: '6tr - 8tr',
        address: 'Ha noi'),
    CompanyModel(
        logoImage:
            'https://c8.alamy.com/comp/PXPBDW/building-logo-design-real-estate-company-logo-design-abstract-construction-logo-design-building-logo-design-PXPBDW.jpg',
        title: 'Hi-res',
        rangeSalary: '6tr - 8tr',
        address: 'Ha noi'),
  ];
}
