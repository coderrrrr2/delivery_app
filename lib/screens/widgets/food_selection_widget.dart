import 'package:delivery_app/constants.dart';
import 'package:delivery_app/models/meal_item.dart';
import 'package:flutter/material.dart';

class FoodSelectionWidget extends StatefulWidget {
  const FoodSelectionWidget({Key? key, required this.mealItem})
      : super(key: key);

  final MealItem mealItem;

  @override
  State<FoodSelectionWidget> createState() => _FoodSelectionWidgetState();
}

class _FoodSelectionWidgetState extends State<FoodSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 230,
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 140,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              width: 180,
              height: 170,
              child: Image.network(
                widget.mealItem
                    .image, // Assuming you have a mealImageURL property
                fit: BoxFit.contain, // Use BoxFit.cover for the image
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                      child: Text(
                    "No Network",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ));
                },
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Column(
              children: [
                Text(
                  widget.mealItem.mealName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 23),
                ),
                addHeight(height: 10),
                Row(
                  children: [
                    Text(
                      "\$${widget.mealItem.mealPrice}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset("assets/images/icons8-chili-64.png"))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
