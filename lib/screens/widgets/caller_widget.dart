import 'package:flutter/material.dart';

class CallerWidget extends StatelessWidget {
  const CallerWidget({super.key});

  Widget addWidth({required double width}) {
    return SizedBox(
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 7, 16, 24),
        borderRadius: BorderRadius.circular(100),
      ),
      width: 390,
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Container(
                  width:
                      60, // Set width and height to be the same for a circular shape
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        30), // half of the width or height for a circular shape
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/man with yellow.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                addWidth(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Jordan Keith",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "Courier",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
          addWidth(width: 60),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 106, 104, 104),
                borderRadius: BorderRadius.circular(50)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.call,
                color: Colors.green,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
