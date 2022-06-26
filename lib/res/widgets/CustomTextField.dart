import 'package:flutter/material.dart';
import 'package:ohrana_truda/res/theme/consts.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      this.height = 80,
      this.width,
      this.hintText,
      this.stroke = true,
      this.bottomMargin = 0.0,
      this.onChanged,
      this.isError = false,
      this.onFieldSubmitted,
      this.onEditingComplete})
      : super(key: key);

  late double height;
  late double? width;
  late String? hintText;
  late bool isError;
  late bool stroke;
  late double bottomMargin;
  late Function(String)? onChanged;
  late Function()? onEditingComplete;
  late Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(bottom: bottomMargin),
      decoration: BoxDecoration(
        borderRadius: kDefauldborderRadius,
        border: isError
            ? Border.all(color: Colors.redAccent)
            : stroke
                ? Border.all(color: Colors.white12)
                : null,
        color: Color(0x2442486B),
      ),
      child: Center(
        child: TextFormField(
          onChanged: onChanged,
          textInputAction: TextInputAction.newline,
          onFieldSubmitted: onFieldSubmitted,
          onEditingComplete: onEditingComplete,
          textAlign: TextAlign.center,
          minLines: 1,
          maxLines: 3,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          cursorColor: Colors.white,
          decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              hintText: hintText,
              hintMaxLines: 1,
              hintStyle: const TextStyle(
                  color: Colors.white12, fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
