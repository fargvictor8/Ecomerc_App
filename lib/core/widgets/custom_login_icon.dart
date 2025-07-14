import 'package:flutter/material.dart';

class CustomLoginIcon extends StatelessWidget {

  final String imagePth;
  final void Function()? onTap;

  const CustomLoginIcon({super.key, required this.imagePth, this.onTap});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 27,
        backgroundColor: Colors.pink,

        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child:  Image.asset(imagePth ,
            width: 30,
            height: 30,),
        ),
      ),
    );
  }
}
