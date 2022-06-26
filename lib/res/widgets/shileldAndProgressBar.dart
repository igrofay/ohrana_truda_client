import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShieldAndProgressBar extends StatelessWidget {
  const ShieldAndProgressBar({
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
