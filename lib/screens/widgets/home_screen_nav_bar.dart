import 'package:flutter/material.dart';

class HomeScreenNavBar extends StatelessWidget {
  const HomeScreenNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          height: 60,
          color: const Color.fromARGB(255, 35, 35, 35),
          child: Row(
            children: [
              navItem(Icons.remove_circle_outlined),
              navItem(Icons.search),
              navItem(Icons.favorite),
              navItem(Icons.search)
            ],
          ),
        ),
      ),
    );
  }
}

Widget navItem(IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(left: 40, top: 20, right: 40, bottom: 30),
    child: Icon(
      icon,
      color: Colors.grey,
    ),
  );
}
