import 'package:flutter/material.dart';
import 'package:jobportal/UI/Screens/Authentication/sign-up/register_Screen.dart';
import 'package:jobportal/UI/Screens/register_for_organization.dart';
import 'package:jobportal/UI/custom_widgets/custom_blue_button.dart';
import 'package:jobportal/UI/custom_widgets/custom_header.dart';
import 'package:jobportal/UI/custom_widgets/form_conatiner.dart';
import 'package:jobportal/core/constants/colors.dart';
import 'package:jobportal/core/constants/text_style.dart';

class RegisterButtonsForBoth extends StatelessWidget {
  const RegisterButtonsForBoth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldBgColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(17, 50, 15, 0),
        child: Column(
          children: [
            CustomHeader("Well-come "),
            SizedBox(height: 100),
            FormContainer(
              child: Column(
                children: [
                  CustomBlueButton(
                    text: "Register as Applicant",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomBlueButton(
                    text: "Register as Organization ",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RegisterScreenForOrganization()));
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
                  "Already have account!",
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
                    "Login",
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
