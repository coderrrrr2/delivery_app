import 'package:flutter/material.dart';

class FoodCategories extends StatefulWidget {
  const FoodCategories({
    Key? key,
    required this.entryObject,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  final MapEntry<String, String> entryObject;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  State<FoodCategories> createState() => _FoodCategoriesState();
}

class _FoodCategoriesState extends State<FoodCategories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18, left: 18),
      child: Column(
        children: [
          GestureDetector(
            onTap: widget.onPressed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: widget.isSelected
                    ? const Color.fromARGB(255, 31, 30, 30)
                    : Colors.white,
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
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: widget.isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
