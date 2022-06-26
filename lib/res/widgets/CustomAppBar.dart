import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ohrana_truda/res/theme/colors.dart';
import 'package:ohrana_truda/res/theme/consts.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(
    this.items, {
    Key? key,
  }) : super(key: key);

  late List<String> items;

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
                    children: List.generate(items.length, (index) {
                      if (index == items.length - 1) {
                        return AppBarNavText(items[index]);
                      }
                      return AppBarNavText(
                        items[index],
                        rightMargin: kDefaultPadding * 2,
                      );
                    }),
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
    this.rightMargin = 0.0,
  }) : super(key: key);

  late String text;
  late double rightMargin;

  @override
  State<AppBarNavText> createState() => _AppBarNavTextState();
}

class _AppBarNavTextState extends State<AppBarNavText> {
  double _indicatorWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: widget.rightMargin),
      child: MouseRegion(
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
      ),
    );
  }
}
