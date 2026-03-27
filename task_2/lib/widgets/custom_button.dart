import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_2/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text});
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    bool isDisabled = (onTap == null);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,

        decoration: BoxDecoration(
          color:isDisabled ? Colors.grey[400] : AppColors().primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Text(
          text,
          style: GoogleFonts.mulish(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
