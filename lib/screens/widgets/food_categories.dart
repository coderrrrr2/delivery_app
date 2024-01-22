import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FoodCategories extends StatefulWidget {
  FoodCategories({
    super.key,
    required this.entryObject,
  });
  final MapEntry<String, String> entryObject;

  @override
  State<FoodCategories> createState() => _FoodCategoriesState();
}

class _FoodCategoriesState extends State<FoodCategories> {
  Color containerColor = Colors.white;

  Color fontColor = Colors.grey;

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18, left: 18),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                containerColor = const Color.fromARGB(255, 47, 45, 45);
                fontColor = Colors.black;
              });
            },
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
                  widget.entryObject.value,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.entryObject.key,
            style: TextStyle(fontWeight: FontWeight.w700, color: fontColor),
          ),
        ],
      ),
    );
  }
}
