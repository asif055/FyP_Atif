import 'package:flutter/material.dart';
import 'package:jobportal/UI/Screens/Authentication/sign-up/sign_up_viewmodel.dart';
import 'package:jobportal/UI/custom_widgets/custom_blue_button.dart';
import 'package:jobportal/UI/custom_widgets/custom_header.dart';
import 'package:jobportal/core/constants/colors.dart';
import 'package:jobportal/core/constants/text_style.dart';
import 'package:provider/provider.dart';

import '../sign-in/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  /* String fullName;
  String fatherName;
  String pasword;
  String email;
  String phoneNum;*/
  @override
  Widget build(BuildContext context) {
    ///when you have to given the sized adjestment you have to wrape the Scafold into:
    ///widget name=SingleChild Scroll View
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: scafoldBgColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(17, 50, 15, 0),
              child: model.busyState
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : Column(
                      children: [
                        ///Header_Section
                        CustomHeader("REGISTER"),
                        const SizedBox(height: 56),

                        GestureDetector(
                          child: Container(
                            height: 95,
                            width: 95,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300,
                            ),
                            child: model.profileImage != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.file(
                                      model.profileImage!,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : const Icon(
                                    Icons.person,
                                  ),
                          ),
                          onTap: () {
                            _showPicker(context, model);
                          },
                        ),
                        const SizedBox(height: 20),

                        ///Register

                        Form(
                          key: _formKey,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 20),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    hintText: 'Name',
                                  ),
                                  onSaved: (String? value) {
                                    model.user.name = value;
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter valid name';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.email),
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
                                    icon: Icon(Icons.phone),
                                    hintText: 'Phone number',
                                  ),
                                  onSaved: (String? value) {
                                    model.user.phoneNumber = value;
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter valid phone number';
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
                                      return 'Please enter valid phone number';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.location_city),
                                    hintText: 'City',
                                  ),
                                  obscureText: true,
                                  onSaved: (String? value) {
                                    model.user.city = value;
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter valid city';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Is Institution?'),
                                    Switch(
                                      // This bool value toggles the switch.
                                      value: model.user.isInstitution ?? false,
                                      onChanged: (bool value) {
                                        model.toogleIsInstitution();
                                        debugPrint(
                                            '${model.user.isInstitution}');
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 36,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text:
                                  'please note that you must use your official',
                              style:
                                  regularBlackTextStyle.copyWith(fontSize: 13),
                              children: [
                                TextSpan(
                                  text: 'Student email',
                                  style: regularBlackTextStyle.copyWith(
                                      fontSize: 13, color: blueThemeColor),
                                ),
                                const TextSpan(
                                  text: 'while registration',
                                )
                              ]),
                        ),

                        ///information text
                        /*      Text("Please note that you must use you'r Official email address",
                   textAlign: TextAlign.center,
                  style: regularBlackTextStyle.copyWith(
                    fontSize: 17,
                  ),
                ),*/
                        ///  SizedBox(height: 100,),

                        ///Register button
                        /*  RaisedButton(onPressed: (){
                  print("registerButton pressed");
                })*/
                        const SizedBox(height: 62),
                        CustomBlueButton(
                            text: "Register",
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (model.profileImage != null) {
                                  _formKey.currentState!.save();
                                  await model.uplaodImage(model.profileImage!);
                                }
                              }
                              print("Register button pressed");
                            }),
                        const SizedBox(height: 20),

                        ///register Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "If You have already account?",
                              style:
                                  regularBlackTextStyle.copyWith(fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Text(
                                "Log In",
                                style: boldBlueTextStyle.copyWith(fontSize: 14),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  _showPicker(BuildContext context, SignUpViewModel model) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Camera'),
                  onTap: () {
                    model.getFromCamera();
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Photo Library'),
                onTap: () {
                  model.getFromGallery();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
