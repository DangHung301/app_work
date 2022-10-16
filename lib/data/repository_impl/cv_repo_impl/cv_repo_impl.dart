import 'dart:io';

import 'package:dio/dio.dart';
import 'package:recruit_app/data/response/cv/cv_response.dart';
import 'package:recruit_app/data/response/cv/detail_cv_response.dart';
import 'package:recruit_app/data/response/cv/upload_file_reponse.dart';
import 'package:recruit_app/data/response/message_response.dart';
import 'package:recruit_app/data/result.dart';
import 'package:recruit_app/data/service/remote/api_client.dart';
import 'package:recruit_app/domain/repositories/base/base_repositories.dart';
import 'package:recruit_app/domain/repositories/repo/cv/cv_repository.dart';
import 'package:recruit_app/until/const/api_const.dart';
import 'package:recruit_app/until/extension/file.dart';

import '../../request/cv/create_cv_request.dart';

class CVRepoImpl extends BaseRepository implements CvRepository {
  ApiClient apiClient;

  CVRepoImpl(this.apiClient);

  @override
  Future<Result<CVResponse>> getCv() {
    return safeApiCall(apiClient.get(ApiConst.GET_CV),
        mapper: (data) => CVResponse.fromJson(data));
  }

  @override
  Future<Result<MessageResponse>> deleteCv(int id) {
    return safeApiCall(apiClient.delete('${ApiConst.GET_CV}/$id'),
        mapper: (data) => MessageResponse(''));
  }

  @override
  Future<Result<DetailCvResponse>> createCV(CreateCvRequest body) {
    return safeApiCall(apiClient.post(ApiConst.GET_CV, data: body.toJson()),
        mapper: (data) => DetailCvResponse.fromJson(data));
  }

  @override
  Future<Result<UploadFileResponse>> uploadFile(File file) async {
    FormData formData = await postFileDio(file: file);

    return safeApiCall(apiClient.post(ApiConst.UPLOAD_FILE, data: formData),
        mapper: (data) => UploadFileResponse.fromJson(data));
  }

  @override
  Future<Result<DetailCvResponse>> detailCv(int id) {
    return safeApiCall(apiClient.get('${ApiConst.GET_CV}/$id'),
        mapper: (data) => DetailCvResponse.fromJson(data));
  }

  @override
  Future<Result<MessageResponse>> addPrimary(String id) {
    return safeApiCall(apiClient.post(ApiConst.ADD_PRIMARY, data: {'cvId': id}),
        mapper: (data) => MessageResponse(data));
  }

  @override
  Future<Result<MessageResponse>> updateCv(CreateCvRequest body, int id) {
    return safeApiCall(apiClient.put('${ApiConst.GET_CV}/$id', data: body.toJson()),
      mapper: (data) => MessageResponse.fromJson(data));
  }
}
