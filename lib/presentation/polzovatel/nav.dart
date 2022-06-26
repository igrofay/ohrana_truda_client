import 'package:flutter/material.dart';
import 'package:ohrana_truda/res/theme/colors.dart';
import 'package:ohrana_truda/res/theme/consts.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.zero,
      child: LayoutBuilder(
          builder: (context, constraints) => Container(
                margin: EdgeInsets.zero,
                width: constraints.maxWidth,
                height: 50,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    border: Border.all(color: primary),
                    borderRadius: kDefauldborderRadius),
                child: Stack(children: [
                  Positioned.fill(
                      child: AnimatedContainer(
                    margin: EdgeInsets.fromLTRB(
                        (constraints.maxWidth -
                            (constraints.maxWidth / 8) *
                                (9 - navPosition.value)),
                        0,
                        (constraints.maxWidth / 8) * (8 - navPosition.value),
                        0),
                    decoration: BoxDecoration(
                        color: primary, borderRadius: kDefauldborderRadius),
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                  )),
                  Positioned.fill(
                      child: LayoutBuilder(
                    builder: (context, constraints) => Row(
                      children: List.generate(
                          8,
                          (index) => Container(
                              width: constraints.maxWidth / 8,
                              height: 50,
                              child: Center(
                                child: Text(nav[index]),
                              ))),
                    ),
                  )),
                  Positioned.fill(
                      child: LayoutBuilder(
                    builder: (context, constraints) => Row(
                      children: List.generate(
                          8,
                          (index) => Container(
                                width: constraints.maxWidth / 8,
                                height: 50,
                                child: GestureDetector(
                                  onTap: () => setState(() {
                                    changeNavPosition(index + 1);
                                  }),
                                ),
                              )),
                    ),
                  )),
                ]),
              )),
    );
  }
}
