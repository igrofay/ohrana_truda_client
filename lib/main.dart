import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:ohrana_truda/presentation/login/LoginScreen.dart';
import 'package:ohrana_truda/presentation/registration/RegistrationScreen.dart';
import 'package:ohrana_truda/res/theme/colors.dart';
import 'domain/store/app/core_app.dart';
import 'presentation/polzovatel/polzScreen.dart';

import 'depen_inject/location.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final coreApp = getIt.get<CoreApp>();
  MyApp({Key? key}) : super(key: key);

  late final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => Container(),
      ),
      GoRoute(
        path: '/main',
        builder: (BuildContext context, GoRouterState state) => MainScreen(),
      ),
      GoRoute(
        path: '/loginScreen',
        builder: (BuildContext context, GoRouterState state) =>
        LoginScreen(),
      ),
      GoRoute(
        path: '/registrationScreen',
        builder: (BuildContext context, GoRouterState state) =>
       RegistrationScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
        child: MaterialApp.router(
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
        ),
        builder: (_) => autorun((_) =>_effectNavigation(coreApp.stateApp)));
  }
  void _effectNavigation(StateApp state) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      switch (state) {
        case StateApp.authorized:
          _router.go('/main');
          break;
        case StateApp.rejected:
          _router.go('/loginScreen');
          break;
        case StateApp.launch:
          _router.go('/');
          break;
      }
    });
  }
}
