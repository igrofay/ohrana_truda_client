import 'package:flutter/material.dart';

class IdAndButton extends StatelessWidget {
  const IdAndButton({
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
