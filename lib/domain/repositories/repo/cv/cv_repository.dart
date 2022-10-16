import 'dart:io';

import 'package:recruit_app/data/response/cv/cv_response.dart';
import 'package:recruit_app/data/result.dart';
import '../../../../data/request/cv/create_cv_request.dart';
import '../../../../data/response/cv/detail_cv_response.dart';
import '../../../../data/response/cv/upload_file_reponse.dart';
import '../../../../data/response/message_response.dart';

mixin CvRepository {
  Future<Result<CVResponse>> getCv();
  Future<Result<MessageResponse>> deleteCv(int id);
  Future<Result<DetailCvResponse>> createCV(CreateCvRequest body);
  Future<Result<UploadFileResponse>> uploadFile(File image);
}