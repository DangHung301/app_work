import 'package:recruit_app/data/request/home/job_request.dart';
import 'package:recruit_app/data/response/home/jobs_response.dart';
import 'package:recruit_app/data/response/home/name_jobs_response.dart';
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
}
