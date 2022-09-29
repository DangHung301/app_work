
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:recruit_app/config/base/base_cubit.dart';

import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(LoginStateIntial());

  bool isHideClearData = false;
  bool isCheckEye1 = true;
  bool isHideEye1 = false;
  bool passIsError = false;
  bool isUserModel = false;

  Future<User?> lognIn(
    String email,
    String password,
  ) async {
    showLoading();
    showContent();
  }

  void closeDialog() {
    showContent();
  }
}
