import 'package:dio/dio.dart';


abstract class LoginServiceApi {
  Future<Response> login();
}

class LoginService extends LoginServiceApi {
  @override
  Future<Response> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

}