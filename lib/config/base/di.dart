import 'package:get_it/get_it.dart';
import 'package:recruit_app/presentation/tabbar_screen/bloc/main_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() async {
  getIt.registerSingleton<MainCubit>(MainCubit());
}