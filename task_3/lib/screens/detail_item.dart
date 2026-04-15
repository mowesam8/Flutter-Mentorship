import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_3/constants/app_colors.dart';
import 'package:task_3/models/coffe_model.dart';
import 'package:task_3/screens/order.dart';
import 'package:task_3/widgets/custom_button.dart';

class DetailItem extends StatefulWidget {
  const DetailItem({super.key, required this.coffe});
  final CoffeModel coffe;

  @override
  State<DetailItem> createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
  List<String> size = ["S", "M", "L"];
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors().secondaryColor,
            ),
          ),
        ),

        title: Text(
          "Detail",
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors().secondaryColor,
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Image.asset(
              "assets/images/Heart.png",
              color: AppColors().secondaryColor,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 240,
              width: double.maxFinite,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(widget.coffe.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.coffe.title,
                      style: GoogleFonts.sora(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors().primaryTextColor,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      widget.coffe.subtitle,
                      style: GoogleFonts.sora(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors().secondaryTextColor,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Color(0xfffbbe21),
                          size: 20,
                        ),

                        const SizedBox(width: 4),

                        Text(
                          widget.coffe.rate,
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors().primaryTextColor,
                          ),
                        ),

                        const SizedBox(width: 4),

                        Text(
                          ("(230)"),
                          style: GoogleFonts.sora(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors().secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        _buildSingleIcon(iconPath: "assets/images/icon1.png"),

                        const SizedBox(width: 12),

                        _buildSingleIcon(iconPath: "assets/images/icon2.png"),

                        const SizedBox(width: 12),

                        _buildSingleIcon(iconPath: "assets/images/icon3.png"),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Divider(color: Color(0xffe3e3e3), thickness: 1),
            ),

            Text(
              "Description",
              style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors().primaryTextColor,
              ),
            ),

            const SizedBox(height: 8),

            Text.rich(
              TextSpan(
                style: GoogleFonts.sora(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff767676),
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text:
                        "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ",
                  ),

                  TextSpan(
                    text: "Read More",
                    style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors().primaryColor,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              "Size",
              style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors().primaryTextColor,
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 41,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: size.length,
                separatorBuilder: (_, __) => SizedBox(width: 16),
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 41,
                      width: 96,
                      padding: EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: isSelected ? Color(0xfff9f2ed) : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: isSelected
                              ? AppColors().primaryColor
                              : Color(0xffe3e3e3),
                        ),
                      ),

                      child: Center(
                        child: Text(
                          size[index],
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: isSelected
                                ? AppColors().primaryColor
                                : AppColors().primaryTextColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff909090),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "\$ ${widget.coffe.price[selectedIndex]}",
                      style: GoogleFonts.sora(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors().primaryColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 34),

                Expanded(
                  child: CustomButton(
                    text: "Buy Now",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (c) => Order(coffe: widget.coffe,price: widget.coffe.price[selectedIndex],),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSingleIcon({required String iconPath}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Color(0xffEDEDED).withValues(alpha: 0.35),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Image.asset(
      iconPath,
      width: 28,
      height: 28,
      color: AppColors().primaryColor,
    ),
  );
}
