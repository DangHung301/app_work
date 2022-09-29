import 'package:flutter/material.dart';
import 'package:recruit_app/config/base/base_cubit.dart';
import 'package:recruit_app/domain/model/home_screen/company_model.dart';
import 'package:recruit_app/domain/model/home_screen/job_model.dart';
import 'package:recruit_app/domain/model/home_screen/new_model.dart';
import 'package:recruit_app/presentation/home/bloc/home_state.dart';
import 'package:recruit_app/until/const/color.dart';
import 'package:rxdart/rxdart.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(HomeStateIntial());

  BehaviorSubject<List<JobModel>> jobsSubject =
      BehaviorSubject<List<JobModel>>();

  BehaviorSubject<List<CompanyModel>> companysSubject =
      BehaviorSubject<List<CompanyModel>>();

  BehaviorSubject<List<NewModel>> newsSubject =
      BehaviorSubject<List<NewModel>>();

  void init() {
    jobsSubject.add(jobsFake);
    companysSubject.add(companys);
    newsSubject.add(newFake);
  }

  List<NewModel> newFake = [
    NewModel(
        image:
            'https://www.cathaypacific.com/content/dam/destinations/new-york/cityguide-gallery/new-york_times-square_920x500.jpg',
        title: 'Nga công bố video huấn luyện lính dự bị động viên',
        date: '27/09/2020'),
    NewModel(
        image:
            'https://www.cathaypacific.com/content/dam/destinations/new-york/cityguide-gallery/new-york_skyline_920x500.jpg',
        title: 'Nga công bố video huấn luyện lính dự bị động viên Nga công bố video huấn luyện lính dự bị động viên',
        date: '27/09/2020'),
    NewModel(
        image:
            'https://www.quocanh.edu.vn/uploads/files/2022/07/21/du-hoc-new-zealand-1-.jpg',
        title: 'Nga công bố video',
        date: '27/09/2020'),
    NewModel(
        image:
            'https://www.cathaypacific.com/content/dam/destinations/new-york/cityguide-gallery/new-york_times-square_920x500.jpg',
        title: 'Nga công bố ',
        date: '27/09/2020'),
    NewModel(
        image:
            'https://www.cathaypacific.com/content/dam/destinations/new-york/cityguide-gallery/new-york_times-square_920x500.jpg',
        title: 'Nga công bố video huấn luyện lính dự bị động viên',
        date: '27/09/2020'),
  ];

  List<JobModel> jobsFake = [
    JobModel(
        job: 'Cơ sở dữ liệu',
        img: Icon(
          Icons.star,
          color: colorPrimary1,
        )),
    JobModel(
        job: 'Lập trình web',
        img: Icon(
          Icons.star,
          color: colorPrimary1,
        )),
    JobModel(
        job: 'Lập trình java',
        img: Icon(
          Icons.star,
          color: colorPrimary1,
        )),
    JobModel(
        job: 'Lập trình Flutter',
        img: Icon(
          Icons.star,
          color: colorPrimary1,
        )),
    JobModel(
        job: 'Lập trình Android',
        img: Icon(
          Icons.star,
          color: colorPrimary1,
        )),
    JobModel(
        job: 'AI',
        img: Icon(
          Icons.star,
          color: colorPrimary1,
        )),
    JobModel(
        job: 'Blockchain',
        img: Icon(
          Icons.star,
          color: colorPrimary1,
        )),
  ];

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
