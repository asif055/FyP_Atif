import 'package:get/get.dart';
import 'package:jobportal/UI/Screens/Authentication/sign-in/login_screen.dart';
import 'package:jobportal/UI/base_viewmodel.dart';
import 'package:jobportal/core/services/auth_service.dart';
import 'package:jobportal/core/services/locator.dart';

class ProfileViewModel extends BaseViewModel {
  final authService = locator<AuthService>();

  logout() async {
    await authService.logout();
    Get.to(() => LoginScreen());
  }
}
