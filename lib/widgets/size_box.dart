import 'package:flutter/material.dart';

class SizeBox extends StatelessWidget {
  double height = 1;
  double width = 1;
  SizeBox({Key? key,this.height = 1, this.width = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
