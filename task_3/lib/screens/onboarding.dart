import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_3/screens/home.dart';
import 'package:task_3/widgets/custom_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Color(0xff050505),
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              width: double.infinity,
              child: Image.asset(
                "assets/images/onboarding.png",
                fit: BoxFit.cover,
              ),
            ),
      
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff050505).withValues(alpha: 0),
                      Color(0xff050505),
                    ],
      
                    stops: [0.6, 1],
                  ),
                ),
              ),
            ),
      
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsetsGeometry.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Fall in Love with Coffee in Blissful Delight!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
      
                    const SizedBox(height: 8),
      
                    Text(
                      "Welcome to our cozy coffee corner, where every cup is a delightful for you.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
      
                    const SizedBox(height: 32),
      
                    CustomButton(
                      text: "Get Started",
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (c) => Home()),
                        );
                      },
                    ),
      
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
