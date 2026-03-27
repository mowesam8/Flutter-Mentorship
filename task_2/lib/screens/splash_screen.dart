import 'package:flutter/material.dart';
import 'package:task_2/constants/app_colors.dart';
import 'package:task_2/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().primaryColor,
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: 250,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
