import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ohrana_truda/depen_inject/location.dart';
import 'package:ohrana_truda/res/theme/colors.dart';
import 'package:ohrana_truda/res/theme/consts.dart';
import 'package:ohrana_truda/res/widgets/CustomButton.dart';
import 'package:ohrana_truda/res/widgets/CustomTextField.dart';

import '../../domain/store/session/registration.dart';

class RegistrationScreen extends StatelessWidget {
  final RegistrationStore store = getIt.get();
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Flex(
      direction: Axis.horizontal,
      children: [LiftSection(context), RightSection(context)],
    ));
  }

  Flexible RightSection(BuildContext context) {
    return Flexible(
        child: Container(
      color: Colors.white,
      child: Container(
        decoration: const BoxDecoration(
            color: backgroundBlue,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(300))),
        child: Center(
            child: SizedBox(
          width: MediaQuery.of(context).size.width / 2 / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AutoSizeText(
                'Зарегистрируйтесь',
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 40),
              ),
              GestureDetector(
                onTap: ()=>GoRouter.of(context).go('/loginScreen'),
                child: const AutoSizeText(
                  'Или войдите в аккаунт!',
                  maxLines: 1,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 0.2,
                      color: Colors.white54,
                      fontWeight: FontWeight.w100,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: kDefaultPadding * 1.5,
              ),
              CustomTextField(
                hintText: 'ИНН',
                height: 50,
                bottomMargin: kDefaultPadding / 2,
              ),
              CustomTextField(
                hintText: 'Логин',
                height: 50,
                bottomMargin: kDefaultPadding / 2,
              ),
              CustomTextField(
                hintText: 'Пароль',
                height: 50,
                bottomMargin: kDefaultPadding / 2,
              ),
              CustomButton(
                'Зарегистрироваться',
                color: Colors.white,
              )
            ],
          ),
        )),
      ),
    ));
  }

  Flexible LiftSection(BuildContext context) {
    return Flexible(
        child: Container(
            color: backgroundBlue,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(300))),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2 / 1.5,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Добро пожаловать!',
                          maxLines: 1,
                          style: TextStyle(
                              color: backgroundBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: 48),
                        ),
                        AutoSizeText(
                          'Войдите или зарегистрируйтесь',
                          maxLines: 1,
                          style: TextStyle(
                              color: backgroundBlue,
                              fontWeight: FontWeight.w400,
                              fontSize: 32),
                        ),
                        SizedBox(
                          height: 38,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/logo.svg',
                              width: 200,
                              height: 200,
                              color: backgroundBlue,
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            )));
  }
}
