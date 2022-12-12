import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobportal/UI/Screens/Home/home_for_applicant.dart';
import 'package:jobportal/UI/Screens/locator.dart';
import 'package:jobportal/UI/Screens/Authentication/sign-in/login_screen.dart';
import 'package:jobportal/UI/Screens/Authentication/sign-up/register_Screen.dart';
import 'package:jobportal/UI/Screens/register_button_for_both.dart';
import 'package:jobportal/core/constants/text_style.dart';
import 'package:jobportal/core/services/auth_service.dart';

import 'login_button_for_both.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    _initialSetup();
    super.didChangeDependencies();
  }

  _initialSetup() async {
    // /
    // / If not connected to internet, show an alert dialog
    // / to activate the network connection.
    // /
    // final connectivityResult = await Connectivity().checkConnectivity();
    // if (connectivityResult == ConnectivityResult.none) {
    //   Get.dialog(
    //     const AlertDialog(
    //       title: Text('Network Error'),
    //       content: Text('Connection to internet failed!'),
    //     ),
    //   );
    //   return;
    // }
  }

  final _authService = locator<AuthService>();

  naviagetToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    if (_authService.isLogin) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreenAplicant()),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    }
  }

  @override
  void initState() {
    naviagetToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 0,
              ),

              ///Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///Logo Icon
                  Image.asset(
                    "assets/images/logo2.PNG.png",
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),

                  /// width: 88,
                  ///height: 88,
                  ///fit: BoxFit.contain,
                  /// ),

                  ///Text of the Logo
                  /* Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Islamia',
                        style: boldBlueTextStyle,



                      ),
                      Text('College',
                        style: regularBlackTextStyle,
                      ),
                    ],

                  )*/
                ],
              ),

              ///Powered By
              Column(
                children: [
                  Text("Powered by"),
                  Image.asset(
                    "assets/images/coollogo_com-14805158.png",
                    width: 134,
                    height: 134,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 36,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
