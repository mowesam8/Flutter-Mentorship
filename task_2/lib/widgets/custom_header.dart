import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.tittle, required this.text});
  final String tittle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.maxFinite,
      alignment: Alignment.topCenter,

      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset("assets/images/auth.png", width: 240),
          ),

          Positioned(
            top: 140,
            left: 0,
            right: 0,

            child: Column(
              children: [
                Text(
                  tittle,
                  style: GoogleFonts.mulish(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),

                Text(
                  text,
                  style: GoogleFonts.mulish(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff252525),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
