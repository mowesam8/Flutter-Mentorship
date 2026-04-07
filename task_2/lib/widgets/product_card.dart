import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_2/constants/app_colors.dart';
import 'package:task_2/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xff171439).withValues(alpha: 0.05),
            blurRadius: 25,
            spreadRadius: 0,
            offset: Offset(3, 10),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            height: 100,
            decoration: BoxDecoration(
              color: product.backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),

            child: Image.asset(product.imagePath),
          ),

          const SizedBox(height: 20),

          Text(
            product.title,
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors().textColor,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            product.brand,
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff9095a6),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            product.price,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff5b41ff),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
