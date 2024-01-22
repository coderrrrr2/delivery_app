import 'package:flutter/material.dart';
import 'package:delivery_app/constants.dart';
import 'package:delivery_app/screens/widgets/food_categories.dart';
import 'package:delivery_app/screens/widgets/home_screen_nav_bar.dart';
import 'package:delivery_app/models/meal_item.dart';
import 'package:delivery_app/screens/meal_details_screen.dart';
import 'package:delivery_app/screens/widgets/food_selection_widget.dart';
import 'package:delivery_app/image_categories_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color containerColor = Colors.white;

  final List<MealItem> meals = [
    const MealItem(mealName: "Pizza"),
    const MealItem(mealName: "Pizza 2"),
    const MealItem(mealName: "Pizza 2"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 234, 234),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 15,
              bottom:
                  60, // Adjust the bottom padding to leave space for the bottom navigation bar
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.menu),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                        width: 50,
                        height: 50,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/bitmoji_png.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Good Food.",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                  ),
                  const Text(
                    "Fast Delivery.",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                  ),
                  addHeight(height: 40),
                  Row(
                    children: imageCategories.entries
                        .map((MapEntry<String, String> entry) => FoodCategories(
                              entryObject: entry,
                            ))
                        .toList(),
                  ),
                  addHeight(height: 60),
                  const Text(
                    "Popular Now",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  addHeight(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 305,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: meals.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () =>
                              moveTo(() => const MealDetailsScreen(), context),
                          child: FoodSelectionWidget(
                            mealName: meals[index].mealName,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: HomeScreenNavBar(),
          ),
        ],
      ),
    );
  }
}
