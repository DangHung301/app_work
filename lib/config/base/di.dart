import 'package:get_it/get_it.dart';
import 'package:recruit_app/data/repository_impl/home_repo_impl/home_repo_impl.dart';
import 'package:recruit_app/data/repository_impl/login_repo_impl/login_repo_impl.dart';
import 'package:recruit_app/data/service/remote/api_client.dart';
import 'package:recruit_app/domain/repositories/repo/home/home_repository.dart';
import 'package:recruit_app/domain/repositories/repo/login_repositories/login_repositories.dart';
import 'package:recruit_app/presentation/tabbar_screen/bloc/main_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() async {
  getIt.registerSingleton<MainCubit>(MainCubit());
}

void configApi() async {
  getIt.registerSingleton<ApiClient>(ApiClient(createDio));

  getIt.registerSingleton<LoginRepository>(LoginRepoImpl(getIt<ApiClient>()));
  getIt.registerSingleton<HomeRepository>(HomeRepoImpl(getIt<ApiClient>()));
}
