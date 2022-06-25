import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ohrana_truda/res/theme/colors.dart';

class BodyContainer extends StatelessWidget {
  BodyContainer({Key? key, required this.child}) : super(key: key);

  late Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: backgroundBlue,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(48))),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            constraints: BoxConstraints(maxWidth: 1600),
            width: MediaQuery.of(context).size.width - 200,
            height: double.infinity,
            child: child)
      ]),
    );
  }
}
