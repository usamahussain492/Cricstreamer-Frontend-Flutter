
import 'package:flutter/material.dart';

BottomNavigationBarItem NavbarItem(String icon,String label,String fillIcon,double iconWidth, double iconHeight){
  return BottomNavigationBarItem(
    activeIcon: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Image.asset(
            fillIcon,
            width: iconWidth,
            height: iconHeight,
          ),
        ),
        Image.asset(
          "assests/images/dot-fill.png",
          width: 8,
          height: 8,
        ),
      ],
    ),
    icon: Padding(
      padding: EdgeInsets.all(4.0),
      child: Image.asset(
        icon,
        width: iconWidth,
        height: iconHeight,
      ),
    ),
    label:label,
  );
}
