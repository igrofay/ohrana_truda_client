import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ohrana_truda/main.dart';
import 'package:ohrana_truda/res/theme/colors.dart';
import 'package:ohrana_truda/res/theme/consts.dart';
import 'package:ohrana_truda/res/widgets/utils.dart';

import 'BodyContainer.dart';
import 'CustomAppBar.dart';
import 'CustomButton.dart';
import 'CustomTextField.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

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
                      FirstSectionAdmin(),
                      kDefaultVerticalPadding,
                      Observer(
                          builder: (_) => AnimatedCrossFade(
                                firstChild: const Zayavki(),
                                secondChild: const Zoloto(),
                                crossFadeState: StateMS.value
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: Duration(milliseconds: 300),
                              )),
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

class Zayavki extends StatelessWidget {
  const Zayavki({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  Column(children: zayavkaDemoData),
                ],
              ),
            ))
          ],
        ),
      ],
    );
  }
}

class Zayavka extends StatelessWidget {
  Zayavka(
    this.id,
    this.date,
    this.organization,
    this.state, {
    Key? key,
    this.height = 80,
    this.width,
    this.bottomMargin = kDefaultPadding / 2,
  }) : super(key: key);

  late String id;
  late String date;
  late String organization;
  late PasportState state;
  late double height;
  late double? width;
  late double bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 0),
      margin: EdgeInsets.only(bottom: bottomMargin),
      decoration: BoxDecoration(
        borderRadius: kDefauldborderRadius,
        border: Border.all(color: getColorFromState(state)),
        color: Color(0x2442486B),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('ID - ' + id),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(organization), getTextFromState(state)],
        ),
        Text(date)
      ]),
    );
  }

  Color getColorFromState(PasportState state) {
    switch (state) {
      case PasportState.moderate:
        return yellow.withAlpha(50);
      case PasportState.sucsess:
        return Colors.greenAccent.withAlpha(50);
      case PasportState.rejected:
        return Colors.red.withAlpha(50);
    }
  }

  Widget getTextFromState(PasportState state) {
    String text = '';

    switch (state) {
      case PasportState.moderate:
        return Text(
          'На модерации',
          style: TextStyle(color: yellow),
        );
      case PasportState.sucsess:
        return Text(
          'На модерации',
          style: TextStyle(color: Colors.greenAccent),
        );
      case PasportState.rejected:
        return Text(
          'На модерации',
          style: TextStyle(color: Colors.red),
        );
    }
  }
}

class Zoloto extends StatelessWidget {
  const Zoloto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  Column(children: zolotoDemoData),
                ],
              ),
            ))
          ],
        ),
      ],
    );
  }
}

class FirstSectionAdmin extends StatelessWidget {
  const FirstSectionAdmin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Личные данные',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              height: 1,
              width: 60,
              color: Colors.white,
            )
          ],
        ),
        Perecluchatel()
      ],
    );
  }
}

class Perecluchatel extends StatefulWidget {
  const Perecluchatel({Key? key}) : super(key: key);

  @override
  State<Perecluchatel> createState() => _PerecluchatelState();
}

class _PerecluchatelState extends State<Perecluchatel> {
  bool _isLeft = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        changeStateMS(!StateMS.value);
        _isLeft = !_isLeft;
      }),
      child: Container(
        width: 240,
        clipBehavior: Clip.hardEdge,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: primary),
            borderRadius: kDefauldborderRadius),
        child: Stack(children: [
          Positioned.fill(
              child: AnimatedContainer(
            margin:
                EdgeInsets.fromLTRB(_isLeft ? 0 : 120, 0, _isLeft ? 120 : 0, 0),
            decoration: BoxDecoration(
                color: primary, borderRadius: kDefauldborderRadius),
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          )),
          Positioned(
            right: 120,
            top: 0,
            bottom: 0,
            child: SizedBox(
              width: 120,
              child: Center(
                  child: AutoSizeText(
                'Заявки на\nпаспорта',
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
            ),
          ),
          Positioned(
            left: 120,
            top: 0,
            bottom: 0,
            child: SizedBox(
              width: 120,
              child: Center(
                  child: AutoSizeText(
                'Золотой знак',
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ]),
      ),
    );
  }
}
