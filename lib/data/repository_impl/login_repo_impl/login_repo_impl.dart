import 'package:recruit_app/data/request/login/login_request.dart';
import 'package:recruit_app/data/response/login_response/login_response.dart';
import 'package:recruit_app/data/result.dart';
import 'package:recruit_app/data/service/remote/api_client.dart';
import 'package:recruit_app/domain/repositories/base/base_repositories.dart';
import 'package:recruit_app/domain/repositories/repo/login_repositories/login_repositories.dart';
import 'package:recruit_app/until/const/api_const.dart';

class LoginRepoImpl extends BaseRepository implements LoginRepository {
  final ApiClient apiClient;

  LoginRepoImpl(this.apiClient);

  @override
  Future<Result<LoginResponse>> login(LoginRequest body) {
    return safeApiCall<LoginResponse>(
        apiClient
            .post(ApiConst.LOGIN, data: body.toJson),
        mapper: (data) => LoginResponse.fromJson(data));
  }
}
