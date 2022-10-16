import 'dart:io';

import 'package:dio/dio.dart';

Future<FormData> postFileDio({String key = 'image', required File file}) async {
  String fileName = file.path.split('/').last;
  FormData formData = FormData.fromMap({
    key: await MultipartFile.fromFile(file.path, filename: fileName),
  });

  return formData;
}

extension ExtensionFile on File {
  Future<FormData> postFileDio({String key = 'image'}) async {
    String fileName = path.split('/').last;
    FormData formData = FormData.fromMap({
      key: await MultipartFile.fromFile(path, filename: fileName),
    });

    return formData;
  }
}
