import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ohrana_truda/res/theme/consts.dart';

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
  String message = 'Добавь архив документов';
  bool highlighted = false;

  setFilePicker(FilePickerCross filePicker) => setState(() {
        filePickerCross = filePicker;
        filePickerCross!.saveToPath(path: filePickerCross!.fileName!);
      });

  void _selectFile(context) {
    FilePickerCross.importMultipleFromStorage().then((filePicker) {
      setFilePicker(filePicker[0]);
      setState(() {
        print(filePicker.first.fileName);
        message = '${filePicker.first.fileName} загружен';
        if (filePicker.first.fileName.toString().split('.').last != 'rar' ||
            filePicker.first.fileName.toString().split('.').last != 'zip' ||
            filePicker.length > 1) {
          message = 'Это не архив(';
        }
      });
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
                color: highlighted ? Colors.white : Colors.white12,
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Text(
                message,
                style: TextStyle(
                    fontSize: 18, color: highlighted ? null : Colors.white12),
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
                setState(() => highlighted = true);
                print('Zone 1 hovered');
              },
              onLeave: () {
                setState(() => highlighted = false);
                print('Zone 1 left');
              },
              onDrop: (ev) async {
                print('Zone 1 drop: ${ev.name}');
                setState(() {
                  message = '${ev.name} загружен';
                  if (ev.name.toString().split('.').last != 'rar' &&
                      ev.name.toString().split('.').last != 'zip') {
                    message = 'Это не архив(';
                  }
                  highlighted = false;
                });
                final bytes = await controller1.getFileData(ev);
              },
              onDropMultiple: (ev) async {
                setState(() {
                  message = 'Это не архив(';
                });
              },
            ),
          ),
          // Positioned.fill(
          //     child: GestureDetector(
          //   onTap: () => _selectFile(context),
          // ))
        ],
      ),
    );
  }
}
