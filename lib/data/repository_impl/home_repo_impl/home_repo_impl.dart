import 'package:recruit_app/data/request/home/apply_job_request.dart';
import 'package:recruit_app/data/request/home/job_request.dart';
import 'package:recruit_app/data/request/home/save_job_request.dart';
import 'package:recruit_app/data/response/home/detail_job_response.dart';
import 'package:recruit_app/data/response/home/jobs_response.dart';
import 'package:recruit_app/data/response/home/name_jobs_response.dart';
import 'package:recruit_app/data/response/message_response.dart';
import 'package:recruit_app/data/result.dart';
import 'package:recruit_app/data/service/remote/api_client.dart';
import 'package:recruit_app/domain/repositories/base/base_repositories.dart';
import 'package:recruit_app/domain/repositories/repo/home/home_repository.dart';
import 'package:recruit_app/until/const/api_const.dart';
import 'package:recruit_app/until/untils.dart';

class HomeRepoImpl extends BaseRepository implements HomeRepository {
  final ApiClient _apiClient;

  HomeRepoImpl(this._apiClient);

  @override
  Future<Result<List<NameJobsResponse>>> getNameJobs() {
    return safeApiCall<List<NameJobsResponse>>(
        _apiClient.get(ApiConst.NAME_JOBS),
        mapper: (data) => Untils.listFromJson<NameJobsResponse>(
            json: data, fromJson: (json) => NameJobsResponse.fromJson(json)));
  }

  @override
  Future<Result<JobsResponse>> getJobs(JobRequest param) {
    return safeApiCall<JobsResponse>(
        _apiClient.get(ApiConst.GET_JOBS, params: param.toJson),
        mapper: (data) =>  JobsResponse.fromJson(data));
  }

  @override
  Future<Result<DetailJobResponse>> detailJob(String id) {
    return safeApiCall<DetailJobResponse>(
        _apiClient.get('${ApiConst.DETAIL_JOBS}/$id',),
        mapper: (data) =>  DetailJobResponse.fromJson(data));
  }

  @override
  Future<Result<MessageResponse>> saveJob(SaveJobRequest body) {
    return safeApiCall<MessageResponse>(
        _apiClient.post(ApiConst.SAVE_JOB, data: body.toJson),
        mapper: (data) =>  MessageResponse(data));
  }

  @override
  Future<Result<JobsResponse>> getJobsApplied() {
    return safeApiCall<JobsResponse>(
        _apiClient.get(ApiConst.GET_JOBS_APPLY,),
        mapper: (data) =>  JobsResponse.fromJson(data));
  }

  @override
  Future<Result<JobsResponse>> getJobsSaved() {
    return safeApiCall<JobsResponse>(
        _apiClient.get(ApiConst.GET_JOBS_SAVE,),
        mapper: (data) =>  JobsResponse.fromJson(data));
  }

  @override
  Future<Result<MessageResponse>> applyJob(ApplyJobResquest body) {
    return safeApiCall<MessageResponse>(
        _apiClient.post(ApiConst.APPLY_JOB, data: body.toJson),
        mapper: (data) =>  MessageResponse(data));
  }
}
