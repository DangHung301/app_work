class AppException implements Exception {
  String title;
  String message;
  int? code;

  AppException(this.title, this.message, [this.code]);

  @override
  String toString() => '$title $message';
}

class CommonException extends AppException {
  CommonException() : super('Error', 'Something went wrong. Please try again later.');
}

class NetworkException extends AppException {
  NetworkException() : super('Error', 'Hệ thống hiện đang mất kết nối. Vui lòng thử lại.');
}

class NoNetworkException extends NetworkException {

}

class TimeoutException extends NetworkException {}

class ExpiredException extends NetworkException {}

class UnauthorizedException extends NetworkException {}

class MaintenanceException extends NetworkException {}
