import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final void Function()? onPressed;
 // const AppBarButton({Key? key}) : super(key: key);
  // AppBarButton({this.icon,this.iconSize,this.onPressed});
  AppBarButton({required this.icon,required this.iconSize,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(

        height: 40,
        width: 40,
        margin: const EdgeInsets.all(6.0),
    decoration: BoxDecoration(
    color: Color(0xFFe6eef5),
    shape: BoxShape.circle,),

      child: IconButton(
        icon: Icon(icon),
        iconSize: iconSize,
        color: Colors.black,
        onPressed: onPressed,
      ),
    );
  }
}
