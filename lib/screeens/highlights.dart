import 'package:cricstreamer/widgets/button.dart';
import 'package:flutter/material.dart';

import '../constants/box_shadows.dart';
import '../constants/colors.dart';


class Highlights extends StatefulWidget {
  const Highlights({Key? key}) : super(key: key);

  @override
  State<Highlights> createState() => _HighlightsState();
}

class _HighlightsState extends State<Highlights> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("hight lights"),
    );
  }
}
