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

const String imageUrl =
    "https://res.cloudinary.com/eralphcloud/image/upload/v1705306732/routelift-list/n2y94lqrjnscu1vslcif.png";
