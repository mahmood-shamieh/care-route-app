import 'package:care_route/components/text_widget.dart';
import 'package:care_route/shared/theme.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? action;
  final String? text;
  final Color? textColor;
  final Color? buttonColor;
  final FontWeight? fontWeight;
  final double? fontSize, width, height;
  final EdgeInsets? padding, margin;

  const MyButton(
      {super.key,
      this.action,
      this.text,
      this.textColor,
      this.fontWeight,
      this.fontSize,
      this.height,
      this.width,
      this.margin,
      this.padding,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: InkWell(
        onTap: action,
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 50,
          decoration: BoxDecoration(
            color: buttonColor ?? MyTheme.mainColor,
            borderRadius: MyTheme.buttonsRadius,
          ),
          child: Center(
            child: TextWidget(
              text: text ?? '',
              color: textColor ?? MyTheme.whiteColor,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
