import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_2/constants/app_colors.dart';

class CustomWatchColor extends StatelessWidget {
  const CustomWatchColor({super.key, required this.color, required this.colorName, required this.isActive});
  final Color color;
  final String colorName;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: isActive ? Color(0xff5b41ff) : Color(0xffdddee3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 8),

          Text(
            colorName,
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive ? AppColors().textColor :  Color(0xff9095a6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
