import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/constants/app_colors.dart';
import 'package:task_1/customs/custom_button.dart';
import 'package:task_1/customs/indicator.dart';
import 'package:task_1/screens/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (c) => Login()));
                  },

                  color: Color(0xffe8eced),
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(50),
                  ),

                  child: Text(
                    "Skip",
                    style: GoogleFonts.rubik(
                      color: AppColors().primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 100,
                horizontal: 50,
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/welcome.png",
                    width: 256,
                    fit: BoxFit.fill,
                  ),

                  const SizedBox(height: 32),

                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.rubik(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                        color: Colors.black,
                      ),

                      children: [
                        TextSpan(text: "Welcome to App"),

                        TextSpan(
                          text: "Name",

                          style: TextStyle(color: AppColors().primaryColor),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    "Lorem ipsum dolor elit elit elit Volupta consectetur adipisicing ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.2,
                      color: Color(0xff757575),
                    ),
                  ),

                  const SizedBox(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Indicator(width: 8, color: Color(0xffedeeef)),

                      const SizedBox(width: 8),

                      Indicator(width: 20, color: AppColors().primaryColor),

                      const SizedBox(width: 8),

                      Indicator(width: 8, color: Color(0xffedeeef)),
                    ],
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (c) => Login()));
              },

              child: CustomButton(text: "Get Started")
            ),
          ],
        ),
      ),
    );
  }
}
