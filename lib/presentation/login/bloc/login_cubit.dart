import 'package:get/get.dart';
import 'package:recruit_app/config/base/base_cubit.dart';
import 'package:recruit_app/config/local/prefs_service.dart';
import 'package:recruit_app/data/request/login/login_request.dart';
import 'package:recruit_app/data/result.dart';
import 'package:recruit_app/domain/repositories/repo/login_repositories/login_repositories.dart';
import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(LoginStateIntial());
  LoginRepository repo = Get.find();
  bool isHideClearData = false;
  bool isCheckEye1 = true;
  bool isHideEye1 = false;
  bool passIsError = false;
  bool isUserModel = false;

  Future<bool> lognIn(
    String email,
    String password,
  ) async {
    showLoading();

    final data =
        await repo.login(LoginRequest(acount: email, passwork: password));

    data.when(
        success: (success) {
          PrefsService.saveToken(success.token ?? '');
          PrefsService.saveUserId(success.user?.id ?? '');
        },
        error: (error) {});
    if (data is Success) {
      showContent();

      return true;
    } else {
      showContent();

      return false;
    }
  }
}
