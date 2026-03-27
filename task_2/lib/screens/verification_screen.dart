import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_2/constants/app_colors.dart';
import 'package:task_2/screens/home_screen.dart';
import 'package:task_2/widgets/custom_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 48, horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Almost there",
                      style: GoogleFonts.mulish(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 32),

                    SizedBox(
                      width: 280,
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.mulish(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),

                          children: [
                            TextSpan(
                              text:
                                  "Please enter the 6-digit code sent to your email ",
                            ),

                            TextSpan(
                              text: "contact.uiuxexperts@gmail.com ",
                              style: TextStyle(color: AppColors().primaryColor),
                            ),

                            TextSpan(text: "for Verification."),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 62),

                    Center(
                      child: MaterialPinField(
                        length: 6,
                        theme: MaterialPinTheme(
                          shape: MaterialPinShape.filled,
                          cellSize: Size(36, 36),
                          spacing: 14,

                          borderRadius: BorderRadius.circular(5),

                          cursorColor: AppColors().primaryColor,
                          fillColor: Color(0xffc4c4c4).withValues(alpha: 0.2),
                          filledFillColor: Color(
                            0xffc4c4c4,
                          ).withValues(alpha: 0.5),
                          focusedFillColor: Color(
                            0xffc4c4c4,
                          ).withValues(alpha: 0.2),
                        ),
                      ),
                    ),

                    const SizedBox(height: 62),

                    CustomButton(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (c) => HomeScreen()),
                        );
                      },
                      text: "Verify",
                    ),

                    const SizedBox(height: 48),

                    Center(
                      child: Text(
                        "Didn’t receive any code? Resend Again",
                        style: GoogleFonts.mulish(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Center(
                      child: Text(
                        "Request a new code in 00:30s",
                        style: GoogleFonts.mulish(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    
  }
}
