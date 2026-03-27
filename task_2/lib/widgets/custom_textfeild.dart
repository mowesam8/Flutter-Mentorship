import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_2/constants/app_colors.dart';

class CustomTextfeild extends StatelessWidget {
  const CustomTextfeild({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.textInputAction,
    this.isPassword = false,
  });
  
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final TextInputAction textInputAction;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors().primaryColor,
      textInputAction: textInputAction,
      obscureText: isPassword,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.mulish(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black.withValues(alpha: 0.5),
        ),

        suffixIcon: Icon(
          icon,
          size: 20,
          color: Colors.black.withValues(alpha: 0.5),
        ),

        filled: true,
        fillColor: Color(0xffc4c4c4).withValues(alpha: 0.2),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),

        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      ),
    );
  }
}
