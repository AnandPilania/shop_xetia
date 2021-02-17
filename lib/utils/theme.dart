import 'package:flutter/material.dart';
import 'package:xetia_shop/constants/color_xetia.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    primaryColor: kOrangeXetia,
    iconTheme: IconThemeData(color: kWhite, size: 24),
    primaryIconTheme: IconThemeData(color: kWhite, size: 20),
    accentIconTheme: IconThemeData(color: const Color(0xff333333)),
    scaffoldBackgroundColor: const Color(0xfff2f2f2),
    primaryColorDark: kWhite,
    primaryColorLight: kBlack,
    textTheme: TextTheme(
        headline1: TextStyle(
            color: kBlack,
            fontFamily: 'SF Pro Rounded',
            fontSize: 34,
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
            color: kOrangeXetia,
            fontFamily: 'SF Pro Rounded',
            fontSize: 24,
            fontWeight: FontWeight.w600),
        headline3: TextStyle(
            color: kBlack,
            fontFamily: 'SF Pro Rounded',
            fontSize: 16.5,
            fontWeight: FontWeight.w700,
            height: 1.5),
        headline4: TextStyle(
            color: kBlack,
            fontFamily: 'SF Pro Rounded',
            fontSize: 14,
            fontWeight: FontWeight.normal),
        headline5: TextStyle(
            color: kBlack,
            fontFamily: 'SF Pro Rounded',
            fontSize: 12,
            fontWeight: FontWeight.normal)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
          color: kWhite.withOpacity(0.8),
          fontFamily: 'SF Pro Rounded',
          fontSize: 17,
          fontWeight: FontWeight.normal),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide.none),
      contentPadding: const EdgeInsets.all(12),
      filled: true,
      fillColor: kBlack,
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    primaryColor: kOrangeXetia,
    iconTheme: IconThemeData(color: kWhite, size: 24),
    primaryIconTheme:
        IconThemeData(color: kHintColor.withOpacity(0.75), size: 20),
    accentIconTheme: IconThemeData(color: const Color(0xff333333)),
    scaffoldBackgroundColor: kScaffoldBgColor,
    primaryColorDark: kBlack,
    primaryColorLight: kWhite,
    textTheme: TextTheme(
        headline1: TextStyle(
            color: kWhite,
            fontFamily: 'SF Pro Rounded',
            fontSize: 34,
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
            color: kOrangeXetia,
            fontFamily: 'SF Pro Rounded',
            fontSize: 24,
            fontWeight: FontWeight.w600),
        headline3: TextStyle(
            color: kHintColor,
            fontFamily: 'SF Pro Rounded',
            fontSize: 16.5,
            fontWeight: FontWeight.w700,
            height: 1.5),
        headline4: TextStyle(
            color: kBlack,
            fontFamily: 'SF Pro Rounded',
            fontSize: 14,
            fontWeight: FontWeight.normal),
        headline5: TextStyle(
            color: kBlack,
            fontFamily: 'SF Pro Rounded',
            fontSize: 12,
            fontWeight: FontWeight.normal)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
          color: kHintColor.withOpacity(0.75),
          fontFamily: 'SF Pro Rounded',
          fontSize: 17,
          fontWeight: FontWeight.normal),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide.none),
      contentPadding: const EdgeInsets.all(12),
      filled: true,
      fillColor: kSearchBgColor,
    ),
  );
}
