import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobportal/UI/Screens/Home/home_for_applicant.dart';
import 'package:jobportal/UI/Screens/dialogs/auth_dialog.dart';
import 'package:jobportal/UI/Screens/locator.dart';
import 'package:jobportal/UI/base_viewmodel.dart';
import 'package:jobportal/core/enums.dart';
import 'package:jobportal/core/model/user.dart';
import 'package:jobportal/core/services/auth_service.dart';
import 'package:jobportal/core/services/custom_auth.dart';
import 'package:jobportal/core/services/database_service.dart';

class LoginViewModel extends BaseViewModel {
  UserProfile user = UserProfile();
  final _authService = locator<AuthService>();
  final _dbService = locator<DatabaseService>();
  late CustomAuthResult authResult;
  bool loading = false;

  signInUserAccount() async {
    loading = true;
    setState(ViewState.busy);
    authResult = await _authService.loginWithEmailAndPassword(
        user.email!, user.password!);
    if (authResult.status == true) {
      user.fcmToken = await FirebaseMessaging.instance.getToken();
      await _dbService.updateFcmToken(
        user.fcmToken,
        authResult.user!.uid,
      );
      debugPrint('Signed In Successfully');
      Get.to(() => const HomeScreenAplicant());
    } else {
      Get.dialog(
        const AuthDialog(
            title: 'Authentication Error!',
            message:
                'Make sure you have entered the correct email and password.'),
      );
      debugPrint('Make sure your password and email are correct!');
    }
    loading = false;
    setState(ViewState.idle);
    notifyListeners();
  }
}
