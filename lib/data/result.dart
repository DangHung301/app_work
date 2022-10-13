import 'package:recruit_app/config/base/app_exeption.dart';

class Result<T> with SealedResult<T> {
  bool get isSuccessful => this is Success<T>;

  Result<T> transform({
    required T Function(T)? success,
    Error<T> Function(Error<T>)? error,
  }) {
    if (this is Success<T> && success != null) {
      (this as Success<T>).data = success.call((this as Success<T>).data);
    }
    if (this is Error<T> && error != null) {}
    return this;
  }
}

class Success<T> extends Result<T> {
  T data;

  Success(this.data);
}

class Error<T> extends Result<T> {
  final AppException exception;

  Error(this.exception);
}

class ServerError<T> extends Error<T> {
  int code;

  ServerError({required AppException exception, required this.code})
      : super(exception);
}

abstract class SealedResult<T> {
  R when<R>(
      {required R Function(T) success, required R Function(Error) error}) {
    if (this is Success) {
      return success.call((this as Success).data);
    }
    if (this is Error) {
      return error.call((this as Error));
    }
    throw new Exception(
        'If you got here, probably you forgot to regenerate the classes? '
        'Try running flutter packages pub run build_runner build');
  }
}
