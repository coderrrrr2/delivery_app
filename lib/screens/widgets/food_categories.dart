import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FoodCategories extends StatelessWidget {
  FoodCategories({super.key, required this.entryObject});
  final MapEntry<String, String> entryObject;
  Color containerColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18, left: 18),
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: containerColor,
              ),
              width: 60,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  entryObject.value,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            entryObject.key,
          ),
        ],
      ),
    );
  }
}
