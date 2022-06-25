import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ohrana_truda/res/theme/colors.dart';
import 'package:ohrana_truda/res/theme/consts.dart';
import 'package:ohrana_truda/res/widgets/BodyContainer.dart';
import 'package:ohrana_truda/res/widgets/CustomButton.dart';
import 'package:ohrana_truda/res/widgets/CustomTextField.dart';

import 'depen_inject/location.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
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

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBarBackground(),
          BodyBackground(),
          CustomAppBar(),
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
                      FirstSection(),
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
                                FormStateIndicator(),
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

class GendersFields extends StatelessWidget {
  const GendersFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Flexible(
              child: CustomTextField(
            hintText: 'Кол-во Женщин',
            stroke: true,
          )),
          SizedBox(
            width: 16,
          ),
          Flexible(
              child: CustomTextField(
            hintText: 'Кол-во Мужчин',
            stroke: true,
          )),
        ],
      ),
    );
  }
}

class FormStateIndicator extends StatelessWidget {
  const FormStateIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.width / 5,
          width: MediaQuery.of(context).size.width / 5,
          padding: EdgeInsets.all(32),
          child: Stack(
            children: [
              Positioned.fill(
                child: CircularProgressIndicator(
                  value: 0.6,
                  backgroundColor: Color(0xFF282F5A),
                  strokeWidth: 8,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ),
              Positioned.fill(
                  child: Center(
                child: Text(
                  '60%',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
                ),
              )),
            ],
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Flexible(
            child: Container(
                height: MediaQuery.of(context).size.width / 5,
                width: MediaQuery.of(context).size.width / 5,
                padding: EdgeInsets.all(22),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/shield.svg',
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Золотой знак',
                      style: TextStyle(fontSize: 26),
                    ),
                    Text('На проверке'),
                  ],
                ))),
      ],
    );
  }
}

class FirstSection extends StatelessWidget {
  const FirstSection({
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
        Text(
          'ID - 28765675',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
        ),
      ],
    );
  }
}

class DropZone extends StatefulWidget {
  DropZone(this.context, {Key? key}) : super(key: key);

  late BuildContext context;

  @override
  State<DropZone> createState() => _DropZoneState();
}

class _DropZoneState extends State<DropZone> {
  late DropzoneViewController controller1;
  late DropzoneViewController controller2;
  String message1 = 'Добавь архив документов';
  String message2 = 'Drop something here';
  bool highlighted1 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 5 + 80,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white12),
          color: Color(0x2442486B),
          borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Positioned.fill(
              child: Center(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/dragAndDrop.svg',
                width: 120,
                height: 120,
                color: highlighted1 ? Colors.white : Colors.white12,
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Text(
                message1,
                style: TextStyle(
                    fontSize: 18, color: highlighted1 ? null : Colors.white12),
              )
            ],
          ))),
          Positioned.fill(
            child: DropzoneView(
              operation: DragOperation.all,
              cursor: CursorType.grab,
              onCreated: (ctrl) => controller1 = ctrl,
              onLoaded: () => print('Zone 1 loaded'),
              onError: (ev) => print('Zone 1 error: $ev'),
              onHover: () {
                setState(() => highlighted1 = true);
                print('Zone 1 hovered');
              },
              onLeave: () {
                setState(() => highlighted1 = false);
                print('Zone 1 left');
              },
              onDrop: (ev) async {
                print('Zone 1 drop: ${ev.name}');
                setState(() {
                  message1 = '${ev.name} загружен';
                  if (ev.name.toString().split('.').last != 'rar' &&
                      ev.name.toString().split('.').last != 'zip') {
                    message1 = 'Это не архив(';
                  }
                  highlighted1 = false;
                });
                final bytes = await controller1.getFileData(ev);
              },
              onDropMultiple: (ev) async {
                print('Zone 1 drop multiple: $ev');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: kAppBarHeight,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(48))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 1600),
              width: MediaQuery.of(context).size.width - 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          child: SvgPicture.asset(
                        'assets/logo.svg',
                        height: 50,
                      )),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Охрана\nтруда',
                        style: TextStyle(
                            color: backgroundBlue, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppBarNavText('Сотрудники'),
                      SizedBox(
                        width: kDefaultPadding * 2,
                      ),
                      AppBarNavText('Анкета'),
                      SizedBox(
                        width: kDefaultPadding * 2,
                      ),
                      AppBarNavText('Личный кабинет'),
                    ],
                  ),
                  Text(
                    'Фамилия Имя Отчество',
                    style: TextStyle(
                        color: backgroundBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarNavText extends StatefulWidget {
  AppBarNavText(
    this.text, {
    Key? key,
  }) : super(key: key);

  late String text;

  @override
  State<AppBarNavText> createState() => _AppBarNavTextState();
}

class _AppBarNavTextState extends State<AppBarNavText> {
  double _indicatorWidth = 0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: MouseCursor.defer,
      onEnter: (event) => setState(() {
        _indicatorWidth = 40;
      }),
      onExit: (event) => setState(() {
        _indicatorWidth = 0;
      }),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.text,
            style: TextStyle(
                color: backgroundBlue,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
          SizedBox(
            height: 1,
          ),
          AnimatedContainer(
            height: 1,
            width: _indicatorWidth,
            color: backgroundBlue,
            duration: const Duration(milliseconds: 300),
          )
        ],
      ),
    );
  }
}

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
