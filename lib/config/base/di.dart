import 'package:get_it/get_it.dart';
import 'package:recruit_app/data/repository_impl/home_repo_impl/home_repo_impl.dart';
import 'package:recruit_app/data/repository_impl/login_repo_impl/login_repo_impl.dart';
import 'package:recruit_app/data/repository_impl/user_repo_impl/user_repo_impl.dart';
import 'package:recruit_app/data/service/remote/api_client.dart';
import 'package:recruit_app/domain/repositories/repo/cv/cv_repository.dart';
import 'package:recruit_app/domain/repositories/repo/home/home_repository.dart';
import 'package:recruit_app/domain/repositories/repo/login_repositories/login_repositories.dart';
import 'package:recruit_app/domain/repositories/repo/user/user_repository.dart';
import 'package:recruit_app/presentation/tabbar_screen/bloc/main_cubit.dart';
import 'package:get/get.dart';

import '../../data/repository_impl/cv_repo_impl/cv_repo_impl.dart';

final getIt = GetIt.instance;

void configureDependencies() async {
  getIt.registerSingleton<MainCubit>(MainCubit());
}

void configApi() async {
  getIt.registerSingleton<ApiClient>(ApiClient(createDio));

  Get.put<LoginRepository>(LoginRepoImpl(getIt<ApiClient>()));
  Get.put<HomeRepository>(HomeRepoImpl(getIt<ApiClient>()));
  Get.put<CvRepository>(CVRepoImpl(getIt<ApiClient>()));
  Get.put<UserRepository>(UserRepoImpl(getIt<ApiClient>()));
}
