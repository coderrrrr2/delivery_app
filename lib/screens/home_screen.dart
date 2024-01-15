import 'package:delivery_app/models/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/image_categories_map.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Text(
                "Good Food.",
                style:
                    GoogleFonts.lato(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Text(
                "Fast Delivery.",
                style: GoogleFonts.lato(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: imageCategories.entries
                    .map(
                      (MapEntry<String, String> entry) => Column(
                        children: [
                          Container(
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
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Popular Now",
                style: GoogleFonts.lato(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  scrollDirection: Axis.horizontal,
                  itemCount: meals.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        width: 400,
                        height: 300,
                        child: Column(
                          children: [
                            const Text('image'),
                            Row(
                              children: [Text(meals[index].mealName)],
                            )
                          ],
                        ),
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
              size: 5,
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
