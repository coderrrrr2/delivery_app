import 'package:flutter/material.dart';

Widget addWidth({required double width}) {
  return SizedBox(
    width: width,
  );
}

Widget addHeight({required double height}) {
  return SizedBox(
    height: height,
  );
}

void moveTo(Function() screen, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => screen(),
  ));
}
