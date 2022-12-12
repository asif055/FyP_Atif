import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final child;
  FormContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFAFAFA),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0,5),
            ),

          ],
        ),
        child: this.child,
      );
  }
}