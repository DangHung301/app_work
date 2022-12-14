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
            title: 'C??ng vi???c n??y ???? ???????c ???ng tuy???n',
            messState: MessState.error);
      } else {
        MessageConfig.show(title: 'Apply th??nh c??ng');
      }
    }, error: (error) {
      MessageConfig.show(title: 'Vui l??ng th??? l???i');
    });

    showContent();
  }

  Future<void> saveJob({required String jobId, required bool isSave}) async {
    showLoading();
    final result =
        await repo.saveJob(SaveJobRequest(jobId: jobId, isSave: isSave));

    result.when(success: (success) {
      if (isSave) {
        MessageConfig.show(title: 'L??u d??? li???u th??nh c??ng');
      } else {
        MessageConfig.show(title: 'Xo?? d??? li???u th??nh c??ng');
      }
    }, error: (error) {
      MessageConfig.show(title: 'Vui l??ng th??? l???i');
    });
    showContent();
  }

  final DetailJobModel fakeModel = DetailJobModel(
    rangeSalary: 'Tho??? thu???n',
    nameJob: 'L???p tr??nh Mobile',
    numberRecuit: 3,
    gender: 'Nam',
    rangeAge: '18 tu???i',
    levelEnglish: 'Kh??ng c??',
    experience: 'Junior',
    misc: 'Kh??ng c??',
    numberPhone: '0123456789',
    employer: 'C??ng ty ABC',
    addressCompany: '???????ng Chi???n Th???ng - T??n Tri???u - Thanh Tr?? - H?? n???i',
    startDate: '30/01/2022',
    endDate: '30/02/2022',
    logoCompany:
        'https://c8.alamy.com/comp/PXPBDW/building-logo-design-real-estate-company-logo-design-abstract-construction-logo-design-building-logo-design-PXPBDW.jpg',
    nameCompany: 'C??ng ty C??? ph???n Ch???ng kho??n Th??nh ph??? H??? Ch?? Minh (HSC)',
    companyModel: CompanyModel(
        nameCompany: 'C??ng ty C??? ph???n Ch???ng kho??n Th??nh ph??? H??? Ch?? Minh (HSC)',
        summary:
            'T??? h??o l?? m???t trong nh???ng t???p ??o??n h??ng ?????u ho???t ?????ng trong l??nh v???c du l???ch. V???i mong mu???n mang ?????n cho du kh??ch nh???ng tr???i nghi???m du l???ch th???i th?????ng, ch??ng t??i ???? x??y d???ng th??nh c??ng m?? h??nh du l???ch th??ng minh (All-In-One) v???i c??c d???ch v??? l??? h??nh, visa, v?? m??y bay, v???n t???i ch???t l?????ng cao, l??u tr??, ??n u???ng v?? vui ch??i gi???i tr?????'),
  );
}

class SelectCV {
  CvDataResponse value;
  bool isSelect;

  SelectCV({required this.value, required this.isSelect});
}
