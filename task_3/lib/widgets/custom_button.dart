import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_3/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors().primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),

        child: Center(
          child: Text(
            text,
            style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
