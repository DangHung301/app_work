import 'package:get/get.dart';
import 'package:recruit_app/config/base/base_cubit.dart';
import 'package:recruit_app/data/request/user/user_request.dart';
import 'package:recruit_app/domain/repositories/repo/user/user_repository.dart';
import 'package:recruit_app/presentation/personal_infomation/bloc/personal_infomation_state.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/response/login_response/login_response.dart';
import '../../../widget/dialog/message_config/message_config.dart';

class PersonalInfomationCubit extends BaseCubit<PersonalInfomationState> {
  PersonalInfomationCubit() : super(PersonalInfomationInitial());

  final UserRepository repo = Get.find();

  BehaviorSubject<UserResponse> personalInfotionSubject = BehaviorSubject();
  BehaviorSubject<DateTime> birthDaySubject = BehaviorSubject();

  Future<void> init() async {
    showLoading();
    await getInfomationUser();
    showContent();
  }

  Future<void> getInfomationUser() async {
    final result = await repo.getInfomationUser();

    result.when(
        success: (success) {
          personalInfotionSubject.add(success);
        },
        error: (error) {});
  }

  Future<void> updateUserInfomation(
      {required String displayName,
      required String email,
      required String gender,
      required DateTime birthday}) async {
    showLoading();
    final result = await repo.updateUser(UserRequest(
        email: email,
        displayname: displayName,
        birthday: birthday.millisecondsSinceEpoch,
        gender: gender));

    result.when(success: (success) {
      if (success.message == 'User was updated successfully.') {
        MessageConfig.show(title: 'Cập nhật User thành công');
      } else {
        MessageConfig.show(
            title: ((success.message ?? '').isEmpty)
                ? 'Vui lòng thử lại'
                : (success.message ?? ''));
      }
    }, error: (error) {
      MessageConfig.show(title: error.toString());
    });
    showContent();
  }
}
