import 'package:get/get.dart';
import 'package:recruit_app/config/base/base_cubit.dart';
import 'package:recruit_app/data/response/cv/cv_response.dart';
import 'package:recruit_app/domain/repositories/repo/cv/cv_repository.dart';
import 'package:recruit_app/presentation/list_cv/bloc/cv_state.dart';
import 'package:recruit_app/presentation/list_cv/ui/text_edit_controller_model.dart';
import 'package:recruit_app/widget/dialog/message_config/message_config.dart';
import 'package:rxdart/rxdart.dart';

class CVCubit extends BaseCubit<CVState> {
  CVCubit() : super(CVStateIntial());

  TextEditControllerModel textEditControllerModel = TextEditControllerModel();

  final CvRepository _repo = Get.find();

  BehaviorSubject<CVResponse> cvSubject = BehaviorSubject();

  Future<void> init() async {
    showLoading();
    await getCV();
    showContent();
  }

  Future<void> getCV() async {
    final result = await _repo.getCv();

    result.when(
        success: (success) {
          cvSubject.add(success);
        },
        error: (error) {});
  }

  Future<void> deleteCV(int id) async {
    showLoading();
    final result = await _repo.deleteCv(id);
    result.when(
        success: (success) async {
          MessageConfig.show(title: 'Xoá ảnh thành công');
          await getCV();
        },
        error: (error) {});
    showContent();
  }
}
