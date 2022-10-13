import 'package:recruit_app/data/request/home/job_request.dart';
import 'package:recruit_app/data/response/home/jobs_response.dart';
import 'package:recruit_app/data/response/home/name_jobs_response.dart';
import 'package:recruit_app/data/result.dart';

mixin HomeRepository {
  Future<Result<List<NameJobsResponse>>> getNameJobs();

  Future<Result<JobsResponse>> getJobs(JobRequest param);
}