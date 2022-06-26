import 'package:flutter/material.dart';
import 'package:ohrana_truda/res/theme/colors.dart';
import 'package:ohrana_truda/res/theme/consts.dart';

Widget AppBarBackground() {
  return Positioned(
    top: 0,
    left: 0,
    right: 0,
    height: kAppBarHeight,
    child: Container(
      color: backgroundBlue,
    ),
  );
}

Widget BodyBackground() {
  return Positioned(
    top: kAppBarHeight,
    left: 0,
    right: 0,
    bottom: 0,
    child: Container(
      color: Colors.white,
    ),
  );
}
