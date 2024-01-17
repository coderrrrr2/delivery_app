import 'package:flutter/material.dart';

class FoodSelectionWidget extends StatefulWidget {
  const FoodSelectionWidget({Key? key, required this.mealName})
      : super(key: key);

  final String mealName;

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
            width: 180,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 120,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              width: 160,
              height: 190,
              child: Image.network(
                "https://res.cloudinary.com/eralphcloud/image/upload/v1705306732/routelift-list/n2y94lqrjnscu1vslcif.png",
                fit: BoxFit.contain, // Use BoxFit.cover for the image
              ),
            ),
          ),
          Container(
            height: 100,
            child: Column(
              children: [
                Text(
                  widget.mealName,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "11",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    SizedBox(
                      height: 40,
                      width: 80,
                    ),
                    Icon(
                      Icons.person,
                      size: 40,
                    )
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
