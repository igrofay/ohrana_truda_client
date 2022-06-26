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
import 'package:ohrana_truda/res/widgets/admin.dart';

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
      home: AdminScreen(),
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
  final GlobalKey exportKey = GlobalKey();
  FilePickerCross? filePickerCross;

  String _fileString = '';
  Set<String?>? lastFiles;
  FileQuotaCross quota = FileQuotaCross(quota: 0, usage: 0);

  late DropzoneViewController controller1;
  late DropzoneViewController controller2;
  String message1 = 'Добавь архив документов';
  String message2 = 'Drop something here';
  bool highlighted1 = false;

  late Object? uploadedImage;

  @override
  void initState() {
    FilePickerCross.listInternalFiles()
        .then((value) => setState(() => lastFiles = value.toSet()));
    FilePickerCross.quota().then((value) => setState(() => quota = value));
    super.initState();
  }

  setFilePicker(FilePickerCross filePicker) => setState(() {
        filePickerCross = filePicker;
        filePickerCross!.saveToPath(path: filePickerCross!.fileName!);
        FilePickerCross.quota().then((value) {
          setState(() => quota = value);
        });
        lastFiles!.add(filePickerCross!.fileName);
        try {
          _fileString = filePickerCross.toString();
        } catch (e) {
          _fileString = 'Not a text file. Showing base64.\n\n' +
              filePickerCross!.toBase64();
        }
      });

  void _selectFile(context) {
    FilePickerCross.importMultipleFromStorage().then((filePicker) {
      setFilePicker(filePicker[0]);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You selected ${filePicker.length} file(s).'),
        ),
      );

      setState(() {});
    });
  }

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
          Positioned.fill(
              child: GestureDetector(
            onTap: () => _selectFile(context),
          ))
        ],
      ),
    );
  }
}
