import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_2/constants/app_colors.dart';
import 'package:task_2/models/product_model.dart';
import 'package:task_2/screens/detail_product.dart';
import 'package:task_2/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tabs = ["Smart Watch", "Apple", "Samsung", "Amazfit", "Huawei"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    String selectedTab = tabs[selectedIndex];

    List<ProductModel> filteredWatches = watches.where((element) {
      if (selectedTab == "Smart Watch") {
        return true;
      } else {
        return element.brand.contains(selectedTab);
      }
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 48, horizontal: 24),

          child: Column(
            children: [
              Text(
                "Find your suitable watch now.",
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: AppColors().textColor,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: AppColors().primaryColor,

                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors().textColor,
                        ),
                        hintText: "Search Product",
                        hintStyle: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors().secondaryTextColor,
                          ),
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: AppColors().secondaryTextColor,
                          ),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: AppColors().secondaryTextColor,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: AppColors().textColor),
                        ),

                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Image.asset(
                    "assets/images/Category.png",
                    width: 19,
                    color: AppColors().textColor,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              SizedBox(
                height: 24,
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
                                fontSize: 14,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w500,
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

              const SizedBox(height: 24),

              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: filteredWatches.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) =>
                                DetailProduct(product: filteredWatches[index]),
                          ),
                        );
                      },
                      child: ProductCard(product: filteredWatches[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
