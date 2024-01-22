import 'dart:io';

import 'package:flutter/material.dart';

class HomeScreenNavBar extends StatelessWidget {
  const HomeScreenNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 16, right: 16, bottom: Platform.isAndroid ? 16 : 0),
      child: BottomAppBar(
        elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 60,
            color: Colors.black,
            child: Row(
              children: [
                navItem(Icons.search),
                navItem(Icons.search),
                navItem(Icons.search),
                navItem(Icons.search)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget navItem(IconData icon) {
  return Expanded(
      child: Icon(
    icon,
    color: Colors.grey,
  ));
}
