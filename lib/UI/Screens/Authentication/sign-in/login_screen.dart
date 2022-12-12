import 'package:flutter/material.dart';
import 'package:jobportal/UI/Screens/Authentication/sign-in/login_viewmodel.dart';
import 'package:jobportal/UI/Screens/Authentication/sign-up/register_Screen.dart';
import 'package:jobportal/UI/custom_widgets/custom_blue_button.dart';
import 'package:jobportal/UI/custom_widgets/custom_header.dart';
import 'package:jobportal/core/constants/colors.dart';
import 'package:jobportal/core/constants/text_style.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

//}
  ///  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: scafoldBgColor,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(17, 50, 15, 0),
            child: Column(
              children: [
                CustomHeader("Log in"),
                SizedBox(height: 100),
                model.loading
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: 'Email',
                              ),
                              onSaved: (String? value) {
                                model.user.email = value;
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.lock),
                                hintText: 'Password',
                              ),
                              obscureText: true,
                              onSaved: (String? value) {
                                model.user.password = value;
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter valid password';
                                }
                                return null;
                              },
                            ),
                          ],
                        )),
                const SizedBox(height: 70),
                CustomBlueButton(
                    text: 'Log In',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        model.signInUserAccount();
                      }
                    }),
                const SizedBox(height: 30),

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
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        "REGISTER",
                        style: boldBlueTextStyle.copyWith(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
