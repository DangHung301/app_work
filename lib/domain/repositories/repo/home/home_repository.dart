import 'package:recruit_app/data/request/home/job_request.dart';
import 'package:recruit_app/data/response/home/detail_job_response.dart';
import 'package:recruit_app/data/response/home/jobs_response.dart';
import 'package:recruit_app/data/response/home/name_jobs_response.dart';
import 'package:recruit_app/data/result.dart';

import '../../../../data/request/home/apply_job_request.dart';
import '../../../../data/request/home/save_job_request.dart';
import '../../../../data/response/message_response.dart';

mixin HomeRepository {
  Future<Result<List<NameJobsResponse>>> getNameJobs();

  Future<Result<JobsResponse>> getJobs(JobRequest param);

  Future<Result<JobsResponse>> getJobsSaved();

  Future<Result<JobsResponse>> getJobsApplied();

  Future<Result<DetailJobResponse>> detailJob(String id);

  Future<Result<MessageResponse>> saveJob(SaveJobRequest body);

  Future<Result<MessageResponse>> applyJob(ApplyJobResquest body);
}