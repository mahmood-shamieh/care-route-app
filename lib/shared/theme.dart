import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color appBarColor = Color(0xffE2E2E2);
  static Color whiteColor = Color(0xffffffff);
  static Color shadowColor = Color(0xffcfcfcf);
  static Color mainColor = Color(0xff125b50);
  static Color greyColor = Color(0xfff1f1f1);
  static Color borderColor = Color(0xffebebeb);
  static Color darkGreyColor = Color(0xffababab);
  static Color textBlackColor = Color(0xff515a64);

  static EdgeInsets margin = EdgeInsets.all(12);
  static EdgeInsets padding = EdgeInsets.all(8);
  static BorderRadius buttonsRadius = BorderRadius.circular(15);

  static getTextStyle1(
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}
