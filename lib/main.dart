import 'package:flutter/material.dart';
import 'package:recruit_app/config/base/di.dart';
import 'package:recruit_app/config/local/prefs_service.dart';
import 'package:recruit_app/presentation/splash/bloc/app_state.dart';
import 'package:recruit_app/presentation/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await PrefsService.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppState appState = AppState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: AppStateCt(
           appState: appState, child: const SplashScreen()),
    );
  }
}

class AppStateCt extends InheritedWidget {
  final AppState appState;

  const AppStateCt({
    Key? key,
    required this.appState,
    required Widget child,
  }) : super(key: key, child: child);

  static AppStateCt of(BuildContext context) {
    final AppStateCt? result =
        context.dependOnInheritedWidgetOfExactType<AppStateCt>();
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
