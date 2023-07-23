import 'package:flutter/material.dart';

import '../constants/colors.dart';

Widget ProfileImage(String url, double width, double height) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(color: green_light, width: 2),
        borderRadius: BorderRadius.circular(100)),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image(
        image: NetworkImage(
          url,
        ),
        fit: BoxFit.fill,
        alignment: Alignment.center,
      ),
    ),
  );
}
