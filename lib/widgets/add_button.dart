import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';


Widget AddButton(String text, VoidCallback onTab, Icon icon){
  return GestureDetector(
    onTap: onTab,
    child: Container(
      width: 170,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: green_dark,
              width: 2
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 8,),
          Text(text,style: gray_dark_style3,)
        ],
      ),
    ),
  );
}