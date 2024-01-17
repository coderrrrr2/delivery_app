import 'package:flutter/material.dart';
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
  final List<MealItem> meals = [
    const MealItem(mealName: "akara"),
    const MealItem(mealName: "akara"),
    const MealItem(mealName: "akara"),
    const MealItem(mealName: "akara"),
    const MealItem(mealName: "akara"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 234, 234),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.draw),
                  const Spacer(),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      "assets/images/bitmoji_png.png",
                      fit: BoxFit.contain,
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
              addHeight(40),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: imageCategories.entries
                    .map(
                      (MapEntry<String, String> entry) => Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(boxShadow: [
                                // TODO: Add shadoW
                              ]),
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                entry.value,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              entry.key,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              addHeight(60),
              const Text(
                "Popular Now",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              addHeight(80),
              SizedBox(
                width: double.infinity,
                height: 310,
                child: ListView.builder(
                  // padding: const EdgeInsets.all(20),
                  scrollDirection: Axis.horizontal,
                  itemCount: meals.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MealDetailsScreen(),
                        ),
                      ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

addHeight(double height) => SizedBox(height: height);


// goTo()
