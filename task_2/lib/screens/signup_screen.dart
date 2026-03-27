import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_2/constants/app_colors.dart';
import 'package:task_2/screens/login_screen.dart';
import 'package:task_2/screens/verification_screen.dart';
import 'package:task_2/widgets/custom_button.dart';
import 'package:task_2/widgets/custom_header.dart';
import 'package:task_2/widgets/custom_textfeild.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  bool agreeTermsAndConditions = false;

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();

    super.dispose();
  }

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomHeader(
                          tittle: "Get Started",
                          text: "by creating a free account.",
                        ),

                        CustomTextfeild(
                          controller: name,
                          hintText: "Full name",
                          icon: Icons.person_2_outlined,
                          textInputAction: TextInputAction.next,
                        ),

                        const SizedBox(height: 12),

                        CustomTextfeild(
                          controller: email,
                          hintText: "Valid email",
                          icon: Icons.mail_outline_rounded,
                          textInputAction: TextInputAction.next,
                        ),

                        const SizedBox(height: 12),

                        CustomTextfeild(
                          controller: phone,
                          hintText: "Phone number",
                          icon: Icons.phone_iphone_outlined,
                          textInputAction: TextInputAction.next,
                        ),

                        const SizedBox(height: 12),

                        CustomTextfeild(
                          controller: password,
                          hintText: "Password",
                          icon: Icons.visibility_off_outlined,
                          textInputAction: TextInputAction.done,
                          isPassword: true,
                        ),

                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Checkbox(
                              value: agreeTermsAndConditions,

                              onChanged: (value) {
                                setState(() {
                                  agreeTermsAndConditions = value!;
                                });
                              },

                              activeColor: AppColors().primaryColor,

                              side: BorderSide(
                                color: Color(0xffcbcbcb),
                                width: 2,
                              ),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(3),
                              ),

                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,

                              visualDensity: const VisualDensity(
                                horizontal: -4,
                              ),
                            ),

                            const SizedBox(width: 5),

                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.mulish(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),

                                children: [
                                  TextSpan(
                                    text:
                                        "By checking the box you agree to our ",
                                  ),

                                  TextSpan(
                                    text: "Terms ",
                                    style: TextStyle(
                                      color: AppColors().primaryColor,
                                    ),
                                  ),

                                  TextSpan(text: "and "),

                                  TextSpan(
                                    text: "Conditions",
                                    style: TextStyle(
                                      color: AppColors().primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        CustomButton(
                          onTap: !agreeTermsAndConditions ? null : (){
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (c) => VerificationScreen(),
                                ),
                              );
                          },

                          text: "Create Account",
                        ),

                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already a member ? ",
                              style: GoogleFonts.mulish(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (c) => LoginScreen(),
                                  ),
                                );
                              },

                              child: Text(
                                "Login",
                                style: GoogleFonts.mulish(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors().primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
