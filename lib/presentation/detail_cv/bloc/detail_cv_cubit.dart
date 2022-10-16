import 'package:get/get.dart';
import 'package:recruit_app/config/base/base_cubit.dart';
import 'package:recruit_app/data/response/cv/detail_cv_response.dart';
import 'package:recruit_app/domain/repositories/repo/cv/cv_repository.dart';
import 'package:recruit_app/presentation/detail_cv/bloc/detail_cv_state.dart';
import 'package:recruit_app/widget/dialog/message_config/message_config.dart';
import 'package:rxdart/rxdart.dart';

class DetailCVCubit extends BaseCubit<DetailCVState> {
  DetailCVCubit() : super(DetailCVStateInit());

  CvRepository repo = Get.find();

  BehaviorSubject<DetailCvResponse> detailCVSubject = BehaviorSubject();

  Future<void> getDetail(int id) async {
    final result = await repo.detailCv(id);

    result.when(
        success: (success) {
          detailCVSubject.add(success);
        },
        error: (error) {});
  }

  Future<void> init(int id) async {
    showLoading();
    await getDetail(id);
    showContent();
  }

  Future<void> addPrimary(int id) async {
    showLoading();
    final result = await repo.addPrimary(id.toString());

    result.when(
        success: (success) async {
          if (success.message == 'Update successfully.') {
            MessageConfig.show(title: 'Lưu thành CV chính thành công');
            await getDetail(id);
          } else {
            MessageConfig.show(
                title: ((success.message ?? '').isEmpty)
                    ? 'Vui lòng thử lại'
                    : (success.message!));
          }
        },
        error: (error) {});

    showContent();
  }
}
