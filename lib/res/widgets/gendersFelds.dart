import 'package:flutter/material.dart';

import 'CustomTextField.dart';

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
