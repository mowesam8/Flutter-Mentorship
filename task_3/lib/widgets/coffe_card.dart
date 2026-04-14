import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_3/constants/app_colors.dart';
import 'package:task_3/models/coffe_model.dart';

class CoffeCard extends StatelessWidget {
  const CoffeCard({super.key, required this.coffe});
  final CoffeModel coffe;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.maxFinite,
      padding: EdgeInsets.all(8),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 140,
                width: double.maxFinite,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(coffe.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 28,
                  width: 56,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(24),
                    ),

                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xff313131).withAlpha(100),
                        Color(0xff111111).withAlpha(200),
                      ],
                    ),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Color(0xfffbbe21),
                        size: 14,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        coffe.rate,
                        style: GoogleFonts.sora(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            coffe.title,
            style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors().primaryTextColor,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            coffe.subtitle,
            style: GoogleFonts.sora(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors().secondaryTextColor,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${coffe.price[1]}",
                style: GoogleFonts.sora(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff050505),
                ),
              ),

              Container(
                padding: EdgeInsets.all(8),

                decoration: BoxDecoration(
                  color: AppColors().primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),

                child: Icon(Icons.add, color: Colors.white, size: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
