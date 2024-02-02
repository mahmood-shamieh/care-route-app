import 'package:care_route/shared/theme.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;

  const TextWidget(
      {super.key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontStyle,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: MyTheme.getTextStyle1(
          color: color ?? MyTheme.mainColor,
          fontSize: fontSize ?? 18,
          fontStyle: fontStyle,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
      ),
    );
  }
}
