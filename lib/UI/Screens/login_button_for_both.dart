import 'package:flutter/material.dart';
import 'package:jobportal/UI/Screens/Authentication/sign-in/login_screen.dart';
import 'package:jobportal/UI/Screens/Authentication/sign-up/register_Screen.dart';
import 'package:jobportal/UI/custom_widgets/custom_blue_button.dart';
import 'package:jobportal/UI/custom_widgets/custom_header.dart';
import 'package:jobportal/UI/custom_widgets/form_conatiner.dart';
import 'package:jobportal/core/constants/colors.dart';
import 'package:jobportal/core/constants/text_style.dart';

import 'login_for_organization.dart';

class LoginButtonsForBoth extends StatelessWidget {
  const LoginButtonsForBoth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldBgColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(17, 50, 15, 0),
        child: Column(
          children: [
            CustomHeader("Well-come "),
            const SizedBox(height: 100),
            FormContainer(
              child: Column(
                children: [
                  CustomBlueButton(
                    text: "Log in as Applicant",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomBlueButton(
                    text: "Login as Organization ",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LoginScreenForOrganization()));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don,t have account!",
                  style: regularBlackTextStyle.copyWith(fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: Text(
                    "REGISTER",
                    style: boldBlueTextStyle.copyWith(fontSize: 14),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
