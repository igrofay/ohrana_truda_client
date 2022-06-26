import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ohrana_truda/presentation/login/LoginScreen.dart';
import 'package:ohrana_truda/res/theme/colors.dart';
import 'presentation/polzovatel/polzScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const MainScreen(),
      ),
      GoRoute(
        path: '/main',
        builder: (BuildContext context, GoRouterState state) =>
            const MainScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
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
    );
  }
}
