import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthDialog extends StatelessWidget {
  final String message;
  final String title;

  const AuthDialog({Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
      ),
      content: Text(
        message,
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.pinkAccent.withOpacity(0.9), // background
            onPrimary: Colors.white, // foreground
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Ok'.tr),
        ),
      ],
    );
  }
}
