import 'package:flutter/material.dart';
import 'package:jobportal/UI/Screens/Profile/profile.dart';
import 'package:jobportal/UI/Screens/profile_for_organization.dart';
import 'package:jobportal/UI/Screens/Authentication/sign-up/register_Screen.dart';
import 'package:jobportal/UI/Screens/register_for_organization.dart';
import 'package:jobportal/UI/custom_widgets/custom_blue_button.dart';
import 'package:jobportal/UI/custom_widgets/custom_header.dart';
import 'package:jobportal/UI/custom_widgets/form_conatiner.dart';
import 'package:jobportal/core/constants/colors.dart';
import 'package:jobportal/core/constants/text_style.dart';

class LoginScreenForOrganization extends StatelessWidget {
  late String email;
  late String password;
//}
  ///  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scafoldBgColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(17, 50, 15, 0),
          child: Column(children: [
            CustomHeader("Log in"),
            SizedBox(height: 100),

            FormContainer(
                child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person),
                    labelText: "Email",
                    hintText: "microsoft@gmail.com",
                  ),
                  onChanged: (val) {
                    email = val;
                  },
                ),
                TextField(
                  obscureText: true,

                  ///its mean's that it's does not show to you
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock_open),
                    labelText: "Password",
                    hintText: "Ali2228*",
                  ),
                  onChanged: (val) {
                    password = val;
                  },
                ),
              ],
            )),
            // SizedBox(20),
            CustomBlueButton(
                text: 'Log In',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfileScreenForOrganization()));
                  print("login button Pressed");
                }),
            SizedBox(
              height: 30,
            ),

            ///for register Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have account?",
                  style: regularBlackTextStyle.copyWith(fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RegisterScreenForOrganization()));
                  },
                  child: Text(
                    "REGISTER",
                    style: boldBlueTextStyle.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
