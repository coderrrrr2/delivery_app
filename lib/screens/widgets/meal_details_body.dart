import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/constants.dart';
import 'package:delivery_app/models/meal_item.dart';
import 'package:flutter/material.dart';

class MealDetailsWidget extends StatelessWidget {
  const MealDetailsWidget({Key? key, required this.mealItem}) : super(key: key);

  final MealItem mealItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AutoSizeText(
              mealItem.mealName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 29,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
          child: Row(
            children: [
              Image.asset(
                "assets/images/icons8-furnitureandhousehold-64.png",
                width: 38,
              ),
              addWidth(width: 5),
              Text(
                " ${mealItem.timeToPrepare} minutes",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
              ),
              addWidth(width: 10),
              Image.asset(
                "assets/images/icons8-flame-96 copy.png",
                width: 40,
              ),
              Text(
                " ${mealItem.calories} calories",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
              ),
              addWidth(width: 10),
              Image.asset(
                "assets/images/icons8-star-96.png",
                width: 40,
              ),
              Text(
                " ${mealItem.rating}",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
        SizedBox(
          height: 170,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Text(
                mealItem.description,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
