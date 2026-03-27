import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 120, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Home",
              style: GoogleFonts.mulish(
                fontSize: 36,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 120),

            Center(child: Image.asset("assets/images/home.png", width: 300)),
          ],
        ),
      ),
    );
  }
}
