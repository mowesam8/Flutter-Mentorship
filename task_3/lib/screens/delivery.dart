import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_3/constants/app_colors.dart';

class Delivery extends StatelessWidget {
  const Delivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/Maps.png", fit: BoxFit.cover),
          ),

          Positioned(
            top: 68,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                _buildActionButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),

                _buildActionButton(icon: Icons.gps_fixed_rounded, onTap: () {}),
              ],
            ),
          ),

          Positioned(
            top: 211,
            left: 66,
            child: Image.asset("assets/images/Delivery Location.png"),
          ),

          Positioned(
            top: 168.5,
            left: 81.5,
            child: Image.asset("assets/images/Rote.png"),
          ),

          Positioned(
            top: 311,
            left: 233,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,

                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    color: Color(0xffb8b8b8).withValues(alpha: 0.25),
                  ),
                ],
              ),
              child: Image.asset("assets/images/Driver.png"),
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.35,
            minChildSize: 0.35,
            maxChildSize: 0.85,
            snap: true,
            snapSizes: [0.35, 0.85],
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),

                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),

                  children: [
                    Column(
                      children: [
                        Container(
                          height: 5,
                          width: 45,

                          decoration: BoxDecoration(
                            color: Color(0xffe3e3e3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          "10 minutes lift",
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors().primaryTextColor,
                          ),
                        ),

                        const SizedBox(height: 2),

                        Text.rich(
                          TextSpan(
                            style: GoogleFonts.sora(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: AppColors().secondaryTextColor,
                            ),
                            children: [
                              TextSpan(text: "Delivery to "),

                              TextSpan(
                                text: "Jl. Kpg Sutoyo",
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors().primaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        _buildDeliveryProgress(),

                        const SizedBox(height: 16),

                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Color(0xffe3e3e3)),
                          ),

                          child: Row(
                            children: [
                              Container(
                                height: 56,
                                width: 56,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Color(0xffe3e3e3)),
                                ),

                                child: Image.asset(
                                  "assets/images/icon1.png",
                                  width: 44,
                                  height: 44,
                                ),
                              ),

                              const SizedBox(width: 16),

                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Delivered your order",
                                    style: GoogleFonts.sora(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors().primaryTextColor,
                                    ),
                                  ),

                                  Text(
                                    "We will deliver your goods to you in\n the shortes possible time.",
                                    style: GoogleFonts.sora(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors().secondaryTextColor,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 56,
                                  width: 56,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/driverProfile.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 16),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                    "Brooklyn Simmons",
                                    style: GoogleFonts.sora(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors().primaryTextColor,
                                    ),
                                  ),

                                  Text(
                                    "Personal Courier",
                                    style: GoogleFonts.sora(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors().secondaryTextColor,
                                      height: 1.5,
                                    ),
                                  ),
                                  ],
                                )
                              ],
                            ),

                            Container(
                                height: 44,
                                width: 44,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Color(0xffe3e3e3)),
                                ),

                                child: Image.asset(
                                  "assets/images/phone.png",
                                  width: 44,
                                  height: 44,
                                ),
                              ),
                          ],
                        ),

                        const SizedBox(height: 16),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildActionButton({
  required IconData icon,
  required VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffededed),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: AppColors().secondaryColor),
    ),
  );
}

Widget _buildDeliveryProgress() {
  return Row(
    children: List.generate(4, (index) {
      return Expanded(
        child: Container(
          height: 4,
          margin: EdgeInsets.only(right: (index == 3) ? 0 : 10),
          decoration: BoxDecoration(
            color: (index == 3) ? Color(0xffe3e3e3) : Color(0xff36C07E),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    }),
  );
}
