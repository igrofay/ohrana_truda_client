import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ohrana_truda/res/theme/colors.dart';

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
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
            child: Container(
                color: backgroundBlue,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(300))),
                  child: Center(
                    child: Column(children: [
                      SvgPicture.asset(
                        'assets/logo.svg',
                        width: 200,
                        height: 200,
                        color: backgroundBlue,
                      )
                    ]),
                  ),
                ))),
        Flexible(
            child: Container(
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
                color: backgroundBlue,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(300))),
          ),
        ))
      ],
    ));
  }
}
