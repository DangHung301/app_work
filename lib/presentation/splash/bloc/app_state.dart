

import 'package:rxdart/rxdart.dart';

class AppState {
  String userId = '';

  bool isUserModel = false;

  final BehaviorSubject<String> getToken = BehaviorSubject<String>();

  void getTokenPrefs() {
  }
}
