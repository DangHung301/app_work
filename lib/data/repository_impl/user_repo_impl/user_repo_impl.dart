import 'package:recruit_app/data/request/user/user_request.dart';
import 'package:recruit_app/data/response/login_response/login_response.dart';
import 'package:recruit_app/data/result.dart';
import 'package:recruit_app/data/service/remote/api_client.dart';
import 'package:recruit_app/domain/repositories/base/base_repositories.dart';
import 'package:recruit_app/domain/repositories/repo/user/user_repository.dart';
import 'package:recruit_app/until/const/api_const.dart';

import '../../response/message_response.dart';

class UserRepoImpl extends BaseRepository implements UserRepository {
  final ApiClient apiClient;

  UserRepoImpl(this.apiClient);

  @override
  Future<Result<UserResponse>> getInfomationUser() {
    return safeApiCall<UserResponse>(
        apiClient.get(ApiConst.DETAIL_USER,),
        mapper: (data) =>  UserResponse.fromJson(data));
  }

  @override
  Future<Result<MessageResponse>> updateUser(UserRequest body) {
    return safeApiCall<MessageResponse>(
        apiClient.put(ApiConst.UPDATE_USER, data: body.toJson()),
        mapper: (data) =>  MessageResponse.fromJson(data));
  }

}