import 'package:flutter/material.dart';

import 'colors.dart';

double defaultPadding = 16.0;

var backgroundGradient = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      MyColors.btnGradentlight,
      MyColors.btnGradentDark,
    ],
  ),
);

var myWhiteAndBlackOuterShaddow = [
  BoxShadow(
    color: MyColors.black.withOpacity(.2),
    offset: const Offset(5, 5),
    blurRadius: 10,
    spreadRadius: 5,
  ),
  const BoxShadow(
    color: Colors.white10,
    offset: Offset(-10, -10),
    blurRadius: 20,
    spreadRadius: 1,
  )
];

extension Padding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}
