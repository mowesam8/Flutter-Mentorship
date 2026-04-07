import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_2/constants/app_colors.dart';
import 'package:task_2/models/product_model.dart';
import 'package:task_2/widgets/custom_watch_color.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key, required this.product});
  final ProductModel product;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  final PageController _controller = PageController();
  List<String> tabs = ["Details", "Review"];
  int selectedIndex = 0;
  String detailsText =
      "The aluminium case is lightweight and made from 100 percent recycled aerospace grade alloy.";
  String reviewText = "User reviews go here...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                minWidth: 0,
                padding: EdgeInsets.all(0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Image.asset(
                  "assets/images/Arrow - Left.png",
                  height: 24,
                ),
              ),

              Image.asset("assets/images/Heart.png", height: 24),
            ],
          ),
        ),
      ),

      body: Column(
        children: [
          Container(
            height: 320,
            alignment: Alignment.center,
            color: Color(0xff171439).withValues(alpha: 0.02),

            child: Image.asset(widget.product.imagePath, height: 320),
          ),

          const SizedBox(height: 24),

          SmoothPageIndicator(
            controller: _controller,
            count: 3,

            effect: ExpandingDotsEffect(
              activeDotColor: Color(0xff5b41ff),
              dotColor: Color(0xff5b41ff).withValues(alpha: 0.1),
              dotHeight: 6,
              dotWidth: 6,
              expansionFactor: 3,
              spacing: 4,
            ),
          ),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: widget.product.title,
                            style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors().textColor,
                              ),
                            ),
                            children: [TextSpan(text: " Gen 2")],
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "( With solo loop )",
                          style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9095a6),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      color: Color(0xfff3ecff).withValues(alpha: 0.26),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Color(0xffffd33c),
                          ),

                          Text(
                            "4.9",
                            style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff9095a6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                Text(
                  "Colors",
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors().textColor,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    CustomWatchColor(
                      color: Color(0xfff0f2f2),
                      colorName: "Silver",
                      isActive: false,
                    ),

                    const SizedBox(width: 16),

                    CustomWatchColor(
                      color: Color(0xfff25745),
                      colorName: "Bright Orange",
                      isActive: true,
                    ),

                    const SizedBox(width: 16),

                    CustomWatchColor(
                      color: Color(0xfffaf6f2),
                      colorName: "Starlight",
                      isActive: false,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                SizedBox(
                  height: 26,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: tabs.length,
                    separatorBuilder: (_, __) => SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tabs[index],
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: isSelected
                                      ? Color(0xff5b41ff)
                                      : Color(0xff9095a6),
                                ),
                              ),
                            ),

                            if (isSelected)
                              Container(
                                width: 40,
                                height: 1.5,
                                color: Color(0xff5b41ff),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  selectedIndex == 0 ? detailsText : reviewText,
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9095a6),
                    ),
                  ),
                ),

                const SizedBox(height: 48),

                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [Color(0xff8743ff), Color(0xff4136f1)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/Buy.png",
                        width: 20,
                        color: Color(0xfff4f4f6),
                      ),

                      const SizedBox(width: 16),

                      Text(
                        "Add to Cart | ",
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xfff4f4f6),
                          ),
                        ),
                      ),

                      Text(
                        widget.product.price,
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xfff4f4f6),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
