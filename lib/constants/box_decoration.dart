import 'package:flutter/material.dart';

import 'box_shadows.dart';
import 'colors.dart';

const BoxDecoration boxDecoration1 =  BoxDecoration(
  color: white,
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(8),
    bottomRight: Radius.circular(8),
  ),
  boxShadow: [shadow1],
);
