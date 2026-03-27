class OnboardingData {
  final String image;
  final String tittle;
  final String text;

  OnboardingData({
    required this.image,
    required this.tittle,
    required this.text,
  });
}

List<OnboardingData> onboardingData = [
  OnboardingData(
    image: "assets/images/onboarding1.png",
    tittle: "Explore the world easily",
    text:
        "To your desire",
  ),
  OnboardingData(
    image: "assets/images/onboarding2.png",
    tittle: "Reach the unknown spot",
    text: "To your destination",
  ),
  OnboardingData(
    image: "assets/images/onboarding3.png",
    tittle: "Make connects with Travello",
    text:
        "To your dream trip",
  ),
];