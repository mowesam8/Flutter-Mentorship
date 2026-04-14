import 'package:flutter/material.dart';

class DarkContainer extends StatelessWidget {
  const DarkContainer({super.key, required this.height, this.child, required this.width});
  final double height;
  final double width;
  final Widget? child;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xff313131), Color(0xff111111)],
        ),
      ),

      child: child,
    );
  }
}
