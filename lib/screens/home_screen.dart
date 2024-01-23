import 'package:flutter/material.dart';
import 'package:delivery_app/constants.dart';
import 'package:delivery_app/providers/providers.dart';
import 'package:delivery_app/screens/widgets/food_categories.dart';
import 'package:delivery_app/screens/widgets/home_screen_nav_bar.dart';
import 'package:delivery_app/screens/meal_details_screen.dart';
import 'package:delivery_app/screens/widgets/food_selection_widget.dart';
import 'package:delivery_app/image_categories_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String selectedCategory = "Main";

  void handleCategoryPressed(String category) {
    setState(() {
      if (selectedCategory == category) {
        selectedCategory = "";
      } else {
        selectedCategory = category;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mealsAsync = ref.watch(dataProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFEBEDEB),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 15,
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
                          borderRadius: BorderRadius.circular(100),
                        ),
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
                  addHeight(height: 20),
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
                              onPressed: () => handleCategoryPressed(entry.key),
                              isSelected: entry.key == selectedCategory,
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
                    height: 330,
                    child: mealsAsync.maybeWhen(
                      data: (meals) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: meals.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => moveTo(
                                () => MealDetailsScreen(mealItem: meals[index]),
                                context,
                              ),
                              child: FoodSelectionWidget(
                                mealItem: meals[index],
                              ),
                            );
                          },
                        );
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      error: (error, stackTrace) {
                        return Center(
                          child: Text('Error loading meals: $error'),
                        );
                      },
                      orElse: () {
                        return const Center(
                          child: CircularProgressIndicator(),
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
