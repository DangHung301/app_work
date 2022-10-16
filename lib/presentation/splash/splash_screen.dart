import 'package:flutter/material.dart';
import 'package:recruit_app/main.dart';
import 'package:recruit_app/presentation/login/ui/login_screen.dart';
import 'package:recruit_app/presentation/tabbar_screen/ui/main_screen.dart';

import '../../widget/dialog/message_config/message_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: AppStateCt.of(context).appState.getToken,
      builder: (context, snapshot) {
        final data = snapshot.data ?? '';
        return screen(data,);
      },
    );
  }

  Widget screen(String token) {
    if (token.isNotEmpty) {
      return const MainTabBarView();
    } else {
      return const LoginScreen();
    }
  }

  @override
  void initState() {
    super.initState();
    MessageConfig.init(context);
  }
}
