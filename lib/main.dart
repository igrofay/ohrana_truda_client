import 'package:flutter/material.dart';
import 'package:ohrana_truda/presentation/login/LoginScreen.dart';
import 'package:ohrana_truda/res/theme/colors.dart';
import 'presentation/polzovatel/polzScreen.dart';

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
      home: LoginScreen(),
    );
  }
}
