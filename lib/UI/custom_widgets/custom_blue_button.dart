import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobportal/core/constants/colors.dart';


class  CustomBlueButton extends StatelessWidget {

  final text;
  final void Function()? onPressed; // the bellow voidCallbacl are same whatever you used in these both
  //final VoidCallback? onPressed; //
  //final Function onPressed;
  CustomBlueButton({this.text, this.onPressed});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 46,
          decoration: BoxDecoration(
            color: blueThemeColor,
            borderRadius: BorderRadius.circular(23),
            boxShadow: [
              BoxShadow(
                color: Color(0x663065d7),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(3,5),
              ),
            ]
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(),
            Text("$text",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ]
        ),
      ),
    );
  }
}
