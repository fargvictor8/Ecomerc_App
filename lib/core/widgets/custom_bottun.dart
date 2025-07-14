import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final double fontSize;
  final double borderRadius;

  const CustomLoginButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = Colors.pink,
    this.fontSize = 30,
    this.borderRadius = 4,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      ),
    );
  }
}
