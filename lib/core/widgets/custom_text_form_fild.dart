import 'package:flutter/material.dart';

class CustomTextFormFild extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final Color? iconColor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool readOnly;

  const CustomTextFormFild({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.obscureText = false,
    this.validator,
    this.fillColor,
    this.iconColor,
    this.hintStyle,
    this.textStyle,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        controller: controller, // important
        keyboardType: keyboardType,
        obscureText: obscureText, // password
        validator: validator, // important
        textInputAction: textInputAction,
        onChanged: onChanged, // important
        onTap: onTap,
        readOnly: readOnly,
        style: textStyle ??
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? Colors.grey.shade200,
          hintText: hintText,
          hintStyle: hintStyle ??
              const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, size: 26, color: iconColor)
              : null,
          suffixIcon: suffixIcon != null
              ? GestureDetector(
            onTap: onSuffixTap,
            child: Icon(suffixIcon, size: 24, color: iconColor),
          )
              : null,

           border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.purple.shade400),
          ) ,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.red.shade400),
          ),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
        ),
      ),
    );
  }
}
