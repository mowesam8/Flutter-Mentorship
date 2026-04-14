import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_3/constants/app_colors.dart';
import 'package:task_3/models/coffe_model.dart';

class Order extends StatefulWidget {
  const Order({super.key, required this.coffe});
  final CoffeModel coffe;

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<String> tabs = ["Deliver", "Pick Up"];
  int selectedIndex = 0;

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
          "Order",
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors().secondaryColor,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(4),

                    decoration: BoxDecoration(
                      color: Color(0xffededed),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Row(
                      children: List.generate(tabs.length, (index) {
                        bool isSelected = selectedIndex == index;

                        return Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },

                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              height: 36,

                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors().primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),

                              child: Center(
                                child: Text(
                                  tabs[index],
                                  style: GoogleFonts.sora(
                                    fontSize: 16,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w400,

                                    color: isSelected
                                        ? Colors.white
                                        : AppColors().primaryTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 24),

                  if (selectedIndex == 0)
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery Address",
                            style: GoogleFonts.sora(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors().primaryTextColor,
                            ),
                          ),

                          const SizedBox(height: 16),

                          Text(
                            "Jl. Kpg Sutoyo",
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff313131),
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
                            style: GoogleFonts.sora(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors().secondaryTextColor,
                            ),
                          ),

                          const SizedBox(height: 16),

                          Row(
                            children: [
                              _buildAction(
                                imagePath: "assets/images/Edit.png",
                                text: "Edit Address",
                              ),

                              const SizedBox(width: 8),

                              _buildAction(
                                imagePath: "assets/images/Document.png",
                                text: "Edit Address",
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 24,
                            ),
                            child: Divider(
                              color: Color(0xffe3e3e3),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            Container(
              height: 4,
              width: double.infinity,
              color: Color(0xfff9f2ed),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(children: [
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildAction({required String imagePath, required String text}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(width: 1, color: AppColors().secondaryTextColor),
    ),

    child: Row(
      children: [
        Image.asset(imagePath, width: 14, height: 14),

        const SizedBox(width: 4),

        Text(
          text,
          style: GoogleFonts.sora(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xff313131),
          ),
        ),
      ],
    ),
  );
}
