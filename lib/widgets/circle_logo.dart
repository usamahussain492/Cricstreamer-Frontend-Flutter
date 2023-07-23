import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CircleLogo extends StatelessWidget {
  String image;
  CircleLogo({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: green_light, width: 2)),
      padding: EdgeInsets.all(20),
      child: Image.asset(
        image,
        color: green_light,
      ),
    );
  }
}
