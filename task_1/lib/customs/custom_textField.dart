import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/constants/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.textInputAction,
    this.password = false,
  });
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextInputAction textInputAction;
  final bool password;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      cursorColor: AppColors().primaryColor,

      textInputAction: textInputAction,
      obscureText: password,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.rubik(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xff757575),
        ),

        prefixIcon: Icon(prefixIcon, color: Color(0xff757575), size: 18),

        suffixIcon:suffixIcon != null ? Icon(suffixIcon, color: Color(0xff757575), size: 18) : null,

        filled: true,
        fillColor: Color(0xfff3f4f6),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),

        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
    );
  }
}
