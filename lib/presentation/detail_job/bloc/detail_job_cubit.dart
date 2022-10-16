import 'package:get/get.dart';
import 'package:recruit_app/config/base/base_cubit.dart';
import 'package:recruit_app/data/request/home/apply_job_request.dart';
import 'package:recruit_app/data/request/home/save_job_request.dart';
import 'package:recruit_app/data/response/home/detail_job_response.dart';
import 'package:recruit_app/domain/model/detail_job/detail_job_model.dart';
import 'package:recruit_app/domain/repositories/repo/cv/cv_repository.dart';
import 'package:recruit_app/domain/repositories/repo/home/home_repository.dart';
import 'package:recruit_app/presentation/detail_job/bloc/detail_job_state.dart';
import 'package:recruit_app/widget/dialog/message_config/message_config.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/response/cv/cv_response.dart';

class DetailJobCubit extends BaseCubit<DetailJobState> {
  DetailJobCubit() : super(DetailJobStateIntial());

  HomeRepository repo = Get.find();

  CvRepository repoCV = Get.find();

  String id = '';

  BehaviorSubject<List<SelectCV>> cvSubject = BehaviorSubject();

  BehaviorSubject<DetailJobResponse> detailJob = BehaviorSubject();

  Future<void> initData(String id) async {
    showLoading();
    this.id = id;
    await getDetailJob();

    await Future.wait([getDetailJob(), getCV()]);

    showContent();
  }

  Future<void> getDetailJob() async {
    final result = await repo.detailJob(id);

    result.when(
        success: (success) {
          detailJob.add(success);
        },
        error: (error) {});
  }

  Future<void> getCV() async {
    final result = await repoCV.getCv();

    result.when(
        success: (success) {
          List<SelectCV> data = [];

          for (var e in (success.items ?? [])) {
            data.add(SelectCV(value: e, isSelect: false));
          }

          cvSubject.add(data);
        },
        error: (error) {});
  }

  void selectCV(SelectCV selecter) {
    for (var e in cvSubject.value) {
      if (e == selecter) {
        e.isSelect = true;
      } else {
        e.isSelect = false;
      }

      cvSubject.add(cvSubject.value);
    }
  }

  Future<void> applyJob({required int cvId, required int jobId}) async {
    showLoading();
    final result =
        await repo.applyJob(ApplyJobResquest(cvId: cvId, jobId: jobId));

    result.when(success: (success) {
      if ((success.message ?? '') == 'This job has already been applied.') {
        MessageConfig.show(
            title: 'Công việc này đã được ứng tuyển',
            messState: MessState.error);
      } else {
        MessageConfig.show(title: 'Apply thành công');
      }
    }, error: (error) {
      MessageConfig.show(title: 'Vui lòng thử lại');
    });

    showContent();
  }

  Future<void> saveJob({required String jobId, required bool isSave}) async {
    showLoading();
    final result =
        await repo.saveJob(SaveJobRequest(jobId: jobId, isSave: isSave));

    result.when(success: (success) {
      if (isSave) {
        MessageConfig.show(title: 'Lưu dữ liệu thành công');
      } else {
        MessageConfig.show(title: 'Xoá dữ liệu thành công');
      }
    }, error: (error) {
      MessageConfig.show(title: 'Vui lòng thử lại');
    });
    showContent();
  }

  final DetailJobModel fakeModel = DetailJobModel(
    rangeSalary: 'Thoả thuận',
    nameJob: 'Lập trình Mobile',
    numberRecuit: 3,
    gender: 'Nam',
    rangeAge: '18 tuổi',
    levelEnglish: 'Không có',
    experience: 'Junior',
    misc: 'Không có',
    numberPhone: '0123456789',
    employer: 'Công ty ABC',
    addressCompany: 'Đường Chiến Thắng - Tân Triều - Thanh Trì - Hà nội',
    startDate: '30/01/2022',
    endDate: '30/02/2022',
    logoCompany:
        'https://c8.alamy.com/comp/PXPBDW/building-logo-design-real-estate-company-logo-design-abstract-construction-logo-design-building-logo-design-PXPBDW.jpg',
    nameCompany: 'Công ty Cổ phần Chứng khoán Thành phố Hồ Chí Minh (HSC)',
    companyModel: CompanyModel(
        nameCompany: 'Công ty Cổ phần Chứng khoán Thành phố Hồ Chí Minh (HSC)',
        summary:
            'Tự hào là một trong những tập đoàn hàng đầu hoạt động trong lĩnh vực du lịch. Với mong muốn mang đến cho du khách những trải nghiệm du lịch thời thượng, chúng tôi đã xây dựng thành công mô hình du lịch thông minh (All-In-One) với các dịch vụ lữ hành, visa, vé máy bay, vận tải chất lượng cao, lưu trú, ăn uống và vui chơi giải trí…'),
  );
}

class SelectCV {
  CvDataResponse value;
  bool isSelect;

  SelectCV({required this.value, required this.isSelect});
}
