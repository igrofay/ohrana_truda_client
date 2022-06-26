import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ohrana_truda/res/theme/colors.dart';
import 'package:ohrana_truda/res/theme/consts.dart';
import 'package:ohrana_truda/res/widgets/BodyContainer.dart';
import 'package:ohrana_truda/res/widgets/CustomAppBar.dart';
import 'package:ohrana_truda/res/widgets/CustomButton.dart';
import 'package:ohrana_truda/res/widgets/CustomTextField.dart';

import 'presentation/polzovatel/polzScreen.dart';
import 'res/widgets/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Montserrat',
          primaryColor: backgroundBlue,
          textTheme: const TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
              decorationColor: Colors.white),
          scaffoldBackgroundColor: Colors.white),
      home: MainScreen(),
    );
  }
}
