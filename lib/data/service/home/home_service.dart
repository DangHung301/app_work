import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../until/const/api_const.dart';
import '../../response/home/jobs_response.dart';

part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

  @GET(ApiConst.GET_JOBS)
  Future<JobsResponse> getJobs(
    @Query('page') int page,
    @Query('size') int size,
    @Query('search') int search,
    @Query('careerId') int careerId,
  );
}
