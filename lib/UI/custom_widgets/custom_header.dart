import 'package:flutter/material.dart';
import 'package:jobportal/core/constants/text_style.dart';

class CustomHeader extends StatelessWidget {
  final text;
  CustomHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/logo2.PNG.png",
          height: 45,
          width: 147,
          fit: BoxFit.contain,
        ),
        Text(
          "$text",
          style: greyBoldTextStyle,
        )
      ],
    );
  }
}
