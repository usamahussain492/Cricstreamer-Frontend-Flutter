import 'package:cricstreamer/constants/box_shadows.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../constants/colors.dart';

class Button extends StatelessWidget {
  late String title;
  final VoidCallback func;
  List<Color> colors;
  String icon;
  double iconWidth;
  double iconHeight;
  bool isLoading;

  Button(
      {Key? key,
      required this.title,
      required this.func,
      this.colors = const [
        green_dark,
        green_light,
      ],
        this.icon = "null",
        this.iconHeight = 17,
        this.iconWidth = 17,
        this.isLoading = false
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [shadow2],
          gradient: LinearGradient(colors: colors),
        ),
        child: isLoading?LoadingIndicator(
            indicatorType: Indicator.ballScaleMultiple,
            colors: const [Colors.white],
            strokeWidth: 1,
            backgroundColor: Colors.transparent,
            pathBackgroundColor: Colors.transparent
        ):Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == "null"?Padding(padding: EdgeInsets.zero):Padding(
              padding: const EdgeInsets.all(17.0),
              child: Image.asset(icon,width: iconHeight,height: iconHeight,),
            ),
            Text(
              title,
              style: TextStyle(color: white),
            ),
          ],
        ),
      ),
    );
  }
}
