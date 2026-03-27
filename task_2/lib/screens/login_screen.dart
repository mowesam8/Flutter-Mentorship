import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_2/constants/app_colors.dart';
import 'package:task_2/screens/signup_screen.dart';
import 'package:task_2/widgets/custom_button.dart';
import 'package:task_2/widgets/custom_header.dart';
import 'package:task_2/widgets/custom_textfeild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool rememberMe = false;

   @override
  void dispose() {
    email.dispose();
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
                          tittle: "Welcome back",
                          text: "sign in to access your account",
                        ),

                        CustomTextfeild(
                          controller: email,
                          hintText: "Enter your email",
                          icon: Icons.mail_outline_rounded,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,

                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value!;
                                    });
                                  },

                                  activeColor: AppColors().primaryColor,

                                  side: BorderSide(
                                    color: Color(0xffcbcbcb),
                                    width: 2,
                                  ),

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      3,
                                    ),
                                  ),

                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,

                                  visualDensity: const VisualDensity(
                                    horizontal: -4,
                                  ),
                                ),

                                const SizedBox(width: 5),

                                Text(
                                  "Remember me",
                                  style: GoogleFonts.mulish(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),

                            MaterialButton(
                              onPressed: () {},

                              padding: EdgeInsets.zero,
                              minWidth: 0,

                              child: Text(
                                "Forget password ?",
                                style: GoogleFonts.mulish(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors().primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        CustomButton(onTap: () {}, text: "Login"),

                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New member ? ",
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
                                    builder: (c) => SignupScreen(),
                                  ),
                                );
                              },

                              child: Text(
                                "Register now",
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
