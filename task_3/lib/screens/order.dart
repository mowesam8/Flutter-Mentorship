import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_3/constants/app_colors.dart';
import 'package:task_3/models/coffe_model.dart';
import 'package:task_3/screens/delivery.dart';
import 'package:task_3/widgets/custom_button.dart';

class Order extends StatefulWidget {
  const Order({super.key, required this.coffe, required this.price});
  final CoffeModel coffe;
  final String price;

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<String> tabs = ["Deliver", "Pick Up"];

  int selectedIndex = 0;
  int quantity = 1;

  double get unitPrice => double.parse(widget.price);
  double get totalPrice => unitPrice * quantity;

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

                  if (tabs[selectedIndex] == "Deliver")
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
                                text: "Add Note",
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 54,
                            width: 54,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(widget.coffe.imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(width: 16),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.coffe.title,
                                style: GoogleFonts.sora(
                                  fontSize: 16,
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
                            ],
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          _buildCounterButton(
                            icon: Icons.remove,
                            onTap: quantity > 1
                                ? () {
                                    setState(() {
                                      quantity--;
                                    });
                                  }
                                : null,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              "$quantity",
                              style: GoogleFonts.sora(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors().primaryTextColor,
                              ),
                            ),
                          ),

                          _buildCounterButton(
                            icon: Icons.add,
                            onTap: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  if (tabs[selectedIndex] == "Deliver")
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Container(
                        height: 56,
                        width: double.infinity,
                        padding: EdgeInsets.all(16),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: 1,
                            color: Color(0xffededed),
                          ),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/Discount.png",
                                  width: 20,
                                ),

                                const SizedBox(width: 16),

                                Text(
                                  "1 Discount is Applies",
                                  style: GoogleFonts.sora(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors().primaryTextColor,
                                  ),
                                ),
                              ],
                            ),

                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: AppColors().primaryTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),

                  Text(
                    "Payment Summary",
                    style: GoogleFonts.sora(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors().primaryTextColor,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        "Price",
                        style: GoogleFonts.sora(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff313131),
                        ),
                      ),

                      Text(
                        "\$ $totalPrice",
                        style: GoogleFonts.sora(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors().primaryTextColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  if (tabs[selectedIndex] == "Deliver")
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          "Delivery Fee",
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff313131),
                          ),
                        ),

                        Row(
                          children: [
                            Text(
                              "\$ 2.0",
                              style: GoogleFonts.sora(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors().primaryTextColor,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),

                            const SizedBox(width: 8),

                            Text(
                              "\$ 1.0",
                              style: GoogleFonts.sora(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors().primaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  children: [
                    Image.asset("assets/images/Wallet.png", width: 20),

                    const SizedBox(width: 16),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "Cash/Wallet",
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors().primaryTextColor,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          "\$ ${(totalPrice + (tabs[selectedIndex] == "Deliver" ? 1 : 0))}",
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors().primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Image.asset("assets/images/Arrow_Down.png", width: 20),
              ],
            ),

            const SizedBox(height: 8),

            CustomButton(
              text: "Order",
              onTap: (tabs[selectedIndex] == "Deliver") ? () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (c) => Delivery()));
              } : null,
            ),

            const SizedBox(height: 12),
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

Widget _buildCounterButton({
  required IconData icon,
  required VoidCallback? onTap,
}) {
  bool isDisabled = onTap == null;

  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xfff9f2ed), width: 1),
      ),
      child: Icon(
        icon,
        size: 16,
        color: isDisabled
            ? AppColors().secondaryTextColor
            : AppColors().secondaryColor,
      ),
    ),
  );
}
