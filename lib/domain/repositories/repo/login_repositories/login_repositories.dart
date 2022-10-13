import 'package:recruit_app/data/request/login/login_request.dart';
import 'package:recruit_app/data/response/login_response/login_response.dart';
import 'package:recruit_app/data/result.dart';

mixin  LoginRepository {
  Future<Result<LoginResponse>> login(LoginRequest body);
}