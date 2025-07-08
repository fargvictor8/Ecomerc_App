import 'package:flutter/material.dart';

class CustomTextAuth extends StatelessWidget {

  final String text;
  const CustomTextAuth({super.key,required this.text});




  @override
  Widget build(BuildContext context) {
    return  Text(text,style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 40
    ),);
  }
}
