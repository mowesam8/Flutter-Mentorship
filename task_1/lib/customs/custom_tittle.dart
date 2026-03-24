import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTittle extends StatelessWidget {
  const CustomTittle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.rubik(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Color(0xff616161),
      ),
    );
  }
}
