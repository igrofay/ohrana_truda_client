import 'package:flutter/material.dart';
import 'package:ohrana_truda/res/theme/consts.dart';
import 'package:ohrana_truda/res/widgets/BodyContainer.dart';
import 'package:ohrana_truda/res/widgets/CustomAppBar.dart';
import 'package:ohrana_truda/res/widgets/CustomButton.dart';
import 'package:ohrana_truda/res/widgets/CustomTextField.dart';
import 'package:ohrana_truda/res/widgets/dropZone.dart';
import 'package:ohrana_truda/res/widgets/gendersFelds.dart';
import 'package:ohrana_truda/res/widgets/idAndButtonTop.dart';
import 'package:ohrana_truda/res/widgets/shileldAndProgressBar.dart';
import 'package:ohrana_truda/res/widgets/utils.dart';

import 'nav.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBarBackground(),
          BodyBackground(),
          CustomAppBar(['Орагнизация', 'Тепловая карта', 'Личный кабинет']),
          Positioned(
            top: kAppBarHeight,
            left: 0,
            right: 0,
            bottom: 0,
            child: BodyContainer(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      IdAndButton(),
                      kDefaultVerticalPadding,
                      Navigation(),
                      kDefaultVerticalPadding,
                      Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Column(
                              children: [
                                Column(
                                  children: List.generate(
                                      leftDemoData.length,
                                      (index) => CustomTextField(
                                            stroke: true,
                                            hintText: leftDemoData[index],
                                            bottomMargin: 8,
                                          )),
                                ),
                                DropZone(context),
                                ShieldAndProgressBar(),
                              ],
                            ),
                          )),
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              children: [
                                Column(
                                  children: List.generate(
                                      rightDemoData.length,
                                      (index) => CustomTextField(
                                            stroke: true,
                                            hintText: leftDemoData[index],
                                            bottomMargin: 8,
                                          )),
                                ),
                                GendersFields(),
                                const SizedBox(
                                  height: kDefaultPadding,
                                ),
                                CustomTextField(
                                  stroke: true,
                                  hintText: 'Комментарий',
                                  height: 80 * 7,
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: kDefaultPadding * 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomButton(
                            'Отправить',
                            color: Color(0xFF5998F5),
                            textColor: Colors.white,
                            width: 200,
                          ),
                          kDefaultHorizontalPadding,
                          CustomButton(
                            'Сохранить',
                            color: Colors.white,
                            width: 200,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: kDefaultPadding * 3,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
