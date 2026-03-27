import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_2/constants/app_colors.dart';
import 'package:task_2/models/onboarding_data.dart';
import 'package:task_2/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingData.length,

              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },

              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 120,
                  horizontal: 18,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(onboardingData[index].image, width: 300),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 260,

                          child: Text(
                            onboardingData[index].tittle,
                            style: GoogleFonts.mulish(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),

                        Text(
                          onboardingData[index].text,
                          style: GoogleFonts.mulish(
                            fontSize: 26,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff929292),
                          ),
                        ),

                        const SizedBox(height: 35),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmoothPageIndicator(
                              controller: _controller,
                              count: onboardingData.length,

                              effect: ExpandingDotsEffect(
                                activeDotColor: AppColors().primaryColor,
                                dotColor: Color(0xffff7686),
                                dotHeight: 6,
                                dotWidth: 13,
                                expansionFactor: 1.3,
                                spacing: 3,
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                _currentPage == (onboardingData.length - 1)
                                    ? Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (c) => LoginScreen(),
                                        ),
                                      )
                                    : _controller.nextPage(
                                        duration: Duration(microseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                              },
                              child: Container(
                                width: 50,
                                height: 50,

                                padding: EdgeInsets.all(10),

                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),

                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 30,
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
        ],
      ),
    );
  }
}
