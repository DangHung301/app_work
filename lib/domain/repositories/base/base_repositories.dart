import 'package:recruit_app/config/base/app_exeption.dart';
import 'package:recruit_app/data/result.dart';
import 'package:dio/dio.dart';

typedef ResponsToMode<Model> = Model Function(dynamic);

abstract class BaseRepository {
  Future<Result<Model>> safeApiCall<Model>(Future<Response> call,
      {required ResponsToMode<Model> mapper}) async {
    try {
      var response = await call;
      return Success<Model>(mapper.call(response.data));
    } on Exception catch (exeption) {
      if (exeption is DioError) {
        switch (exeption.type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
          case DioErrorType.cancel:
            return Error(AppException('Error', 'Vui lòng kết nối lại'));

          case DioErrorType.response:
            return ServerError(
                exception: AppException('Server Error', 'Vui lòng thử lại'),
                code: exeption.response!.statusCode!);
          case DioErrorType.other:
            // TODO: Handle this case.
            return Error(AppException('Error', 'Vui lòng kết nối lại'));
        }
      }

      return Error(AppException('Error', 'Xảy ra lỗi hãy thử lại'));
    }
  }
}
