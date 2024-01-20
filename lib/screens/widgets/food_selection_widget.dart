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
            width: 210,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 140,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              width: 160,
              height: 170,
              child: Image.network(
                "https://res.cloudinary.com/eralphcloud/image/upload/v1705306732/routelift-list/n2y94lqrjnscu1vslcif.png",
                fit: BoxFit.contain, // Use BoxFit.cover for the image
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Column(
              children: [
                Text(
                  widget.mealName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "\$11",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Container(
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
