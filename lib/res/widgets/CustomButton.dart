import 'package:flutter/material.dart';
import 'package:ohrana_truda/presentation/polzovatel/polzScreen.dart';
import 'package:ohrana_truda/res/theme/colors.dart';
import 'package:ohrana_truda/res/theme/consts.dart';

class CustomButton extends StatelessWidget {
  CustomButton(this.text,
      {Key? key,
      required this.color,
      this.textColor = backgroundBlue,
      this.height = 50,
      this.width})
      : super(key: key);

  late String text;
  late Color? color;
  late Color? textColor;
  late double? height;
  late double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => loginTap(context),
      child: Container(
        height: height,
        width: width,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: textColor),
        )),
        decoration: BoxDecoration(
          color: color,
          borderRadius: kDefauldborderRadius,
        ),
      ),
    );
  }
}

loginTap(context) {
  Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const MainScreen(),
      ));
}
