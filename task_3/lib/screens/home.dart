import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_3/constants/app_colors.dart';
import 'package:task_3/models/coffe_model.dart';
import 'package:task_3/screens/detail_item.dart';
import 'package:task_3/ui_components/dark_container.dart';
import 'package:task_3/widgets/coffe_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> tabs = ["All Coffe", "Machiato", "Latte", "Americano"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    String selectedTab = tabs[selectedIndex];

    List<CoffeModel> filteredCoffes = coffes.where((element) {
      if (selectedTab == "All Coffe") {
        return true;
      } else {
        return element.category.contains(selectedTab);
      }
    }).toList();

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            DarkContainer(height: 280, width: double.infinity),

            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Location",
                            style: GoogleFonts.sora(
                              color: AppColors().secondaryTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Row(
                            children: [
                              Text(
                                "Bilzen, Tanjungbalai",
                                style: GoogleFonts.sora(
                                  color: Color(0xffd8d8d8),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(width: 4),

                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xffd8d8d8),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  cursorColor: Color(0xffF9F9F9),

                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors().secondaryColor,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(12),
                                    ),

                                    prefixIcon: Icon(
                                      Icons.search_rounded,
                                      color: AppColors().secondaryTextColor,
                                    ),

                                    hintText: "Search coffee",

                                    hintStyle: GoogleFonts.sora(
                                      color: AppColors().secondaryTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 16),

                              Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                  color: AppColors().primaryColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),

                                child: Icon(
                                  Icons.tune_sharp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          Container(
                            height: 140,
                            width: double.maxFinite,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),

                              image: DecorationImage(
                                image: AssetImage("assets/images/banner.png"),
                                fit: BoxFit.cover,
                              ),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 24,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffed5151),
                                      borderRadius: BorderRadius.circular(8),
                                    ),

                                    padding: EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 6,
                                    ),

                                    child: Text(
                                      "Promo",
                                      style: GoogleFonts.sora(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  Stack(
                                    children: [
                                      Positioned(
                                        top: 12,
                                        child: DarkContainer(
                                          height: 27,
                                          width: 200,
                                        ),
                                      ),

                                      Positioned(
                                        top: 50,
                                        child: DarkContainer(
                                          height: 27,
                                          width: 150,
                                        ),
                                      ),

                                      Text(
                                        "Buy one get\none FREE",

                                        style: GoogleFonts.sora(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          SizedBox(
                            height: 30,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: tabs.length,
                              separatorBuilder: (_, __) => SizedBox(width: 16),
                              itemBuilder: (context, index) {
                                bool isSelected = selectedIndex == index;

                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),

                                    padding: EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),

                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColors().primaryColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(6),
                                    ),

                                    child: Text(
                                      tabs[index],
                                      style: GoogleFonts.sora(
                                        color: isSelected
                                            ? Colors.white
                                            : Color(0xff313131),
                                        fontSize: 14,
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 16),

                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 24,
                                  childAspectRatio: 0.7,
                                ),
                            itemCount: filteredCoffes.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (c) => DetailItem(
                                        coffe: filteredCoffes[index],
                                      ),
                                    ),
                                  );
                                },
                                child: CoffeCard(coffe: filteredCoffes[index]),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),

            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: 0,
              selectedItemColor: AppColors().primaryColor,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.home_filled, color: AppColors().primaryColor),
                      const SizedBox(height: 6),
                      Container(
                        width: 10,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors().primaryColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ],
                  ),

                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_outlined),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
