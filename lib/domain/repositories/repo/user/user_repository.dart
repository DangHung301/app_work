import 'package:recruit_app/data/request/user/user_request.dart';
import 'package:recruit_app/data/response/login_response/login_response.dart';
import 'package:recruit_app/data/result.dart';

import '../../../../data/response/message_response.dart';

mixin UserRepository {
  Future<Result<UserResponse>> getInfomationUser();
  Future<Result<MessageResponse>> updateUser(UserRequest body);
}