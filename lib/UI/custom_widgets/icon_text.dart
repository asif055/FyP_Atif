import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///From these icon_Text we recieve the icon data and the text

class IconText extends StatelessWidget {
 final IconData icon;
 final String text;
 IconText(this.icon,this.text);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: Colors.yellow,),
        SizedBox(width: 10,),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,color: Colors.grey,
          ),
        )
      ],
    );
  }
}
