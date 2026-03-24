import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/constants/app_colors.dart';
import 'package:task_1/customs/custom_button.dart';
import 'package:task_1/customs/custom_textField.dart';
import 'package:task_1/customs/custom_tittle.dart';
import 'package:task_1/screens/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmPassword.dispose();
    
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
                padding: EdgeInsets.symmetric(vertical: 45, horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),

                          child: Container(
                            width: 32,
                            height: 32,

                            decoration: BoxDecoration(
                              color: AppColors().primaryColor.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),

                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 12,
                              color: AppColors().primaryColor,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        CustomTittle(text: "Let’s, Create\nAccount"),

                        const SizedBox(height: 56),

                        CustomTextfield(
                          controller: email,
                          hintText: "Enter your email",
                          prefixIcon: Icons.mail_outline_rounded,
                          textInputAction: TextInputAction.next,
                        ),

                        const SizedBox(height: 16),

                        CustomTextfield(
                          controller: phone,
                          hintText: "Enter your number",
                          prefixIcon: Icons.phone_iphone_outlined,
                          textInputAction: TextInputAction.next,
                        ),

                        const SizedBox(height: 16),

                        CustomTextfield(
                          controller: password,
                          hintText: "Enter your password",
                          prefixIcon: Icons.lock_outline_rounded,
                          suffixIcon: Icons.visibility_off_outlined,
                          textInputAction: TextInputAction.done,
                          password: true,
                        ),

                        const SizedBox(height: 16),

                        CustomTextfield(
                          controller: confirmPassword,
                          hintText: "Confirm your password",
                          prefixIcon: Icons.lock_outline_rounded,
                          suffixIcon: Icons.visibility_off_outlined,
                          textInputAction: TextInputAction.done,
                          password: true,
                        ),

                        
                      ],
                    ),

                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CustomButton(text: "Create Account"),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          "Or Continue with",
                          style: GoogleFonts.rubik(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                            color: Color(0xff9ca3af),
                          ),
                        ),

                        

                        const SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an Account? ",
                              style: GoogleFonts.rubik(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.2,
                                color: Color(0xff6b7280),
                              ),
                            ),

                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(builder: (c) => Login()),
                              ),

                              child: Text(
                                "Sign-In",
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.2,
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