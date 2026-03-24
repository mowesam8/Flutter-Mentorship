import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.imageName,
    required this.onTap,
  });
  final String imageName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: 38,
        height: 38,
        padding: EdgeInsets.all(10),

        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(width: 1.5, color: Color(0xfff5f5f5)),
        ),

        child: Image.asset("assets/images/$imageName",),
      ),
    );
  }
}
