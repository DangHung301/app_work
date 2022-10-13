

import 'package:recruit_app/config/local/prefs_service.dart';
import 'package:rxdart/rxdart.dart';

class AppState {
  String userId = '';

  bool isUserModel = false;

  final BehaviorSubject<String> getToken = BehaviorSubject<String>();

  void getTokenPrefs() {
    getToken.add(PrefsService.getToken());
  }
}
