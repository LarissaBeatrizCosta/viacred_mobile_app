import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

///Controller do timer das páginas
class InactivityController extends ChangeNotifier {
  Timer? _inactivityTimer;
  static const Duration _inactivityDuration = Duration(seconds: 20);

  ///Reseta o timer
  InactivityController() {
    _resetTimer();
  }

  void _redirectHome() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Constants.userKey);

    if (token != null && token.isNotEmpty) {
      Get.offAllNamed('/home');
    }
    return;
  }

  void _resetTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(_inactivityDuration, _redirectHome);
  }

  ///Reseta o timer toda vez que o usuário interage
  void userInteracted() {
    _resetTimer();
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    super.dispose();
  }
}
