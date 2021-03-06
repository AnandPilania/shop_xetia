import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/constants/color_xetia.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    primaryColor: const Color(0xfffbb216),
    iconTheme: IconThemeData(color: kBlack, size: 24),
    primaryIconTheme: IconThemeData(color: kBlack, size: 20),
    accentIconTheme: IconThemeData(color: const Color(0xff333333)),
    scaffoldBackgroundColor: const Color(0xfff2f2f2),
    floatingActionButtonTheme: FloatingActionButtonThemeData(foregroundColor: const Color(0xff333333)),
    primaryColorDark: const Color(0xfff1efe5),
    primaryColorLight: kBlack,
    backgroundColor: kBlack,
    highlightColor: kBlack,
    brightness: Brightness.light,
    cupertinoOverrideTheme:
        CupertinoThemeData().copyWith(brightness: Brightness.light),
    shadowColor: kBlack.withOpacity(0.4),
    canvasColor: Colors.transparent,
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
            fontWeight: FontWeight.normal),
        subtitle1: TextStyle(
            color: kWhite,
            fontFamily: 'SF Pro Rounded',
            fontSize: 14,
            fontWeight: FontWeight.w300)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: kBlack.withOpacity(0.5), fontFamily: 'SF Pro Rounded', fontSize: 17, fontWeight: FontWeight.normal),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(width: 1, color: const Color(0xff4c4c4c).withOpacity(0.5))),
      contentPadding: const EdgeInsets.all(12),
      filled: true,
      fillColor: kWhite,
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    primaryColor: kOrangeXetia,
    iconTheme: IconThemeData(color: kWhite, size: 24),
    primaryIconTheme:
        IconThemeData(color: kHintColor.withOpacity(0.75), size: 20),
    accentIconTheme: IconThemeData(color: const Color(0xff333333)),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(foregroundColor: const Color(0xff333333)),
    scaffoldBackgroundColor: const Color(0xff121212),
    primaryColorDark: kBlack,
    brightness: Brightness.dark,
    cupertinoOverrideTheme:
        CupertinoThemeData().copyWith(brightness: Brightness.dark),
    primaryColorLight: kWhite,
    backgroundColor: kBlack,
    shadowColor: kWhite.withOpacity(0.4),
    highlightColor: const Color(0xff616569),
    canvasColor: Colors.transparent,
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
            color: kWhite,
            fontFamily: 'SF Pro Rounded',
            fontSize: 14,
            fontWeight: FontWeight.normal),
        headline5: TextStyle(
            color: kWhite,
            fontFamily: 'SF Pro Rounded',
            fontSize: 12,
            fontWeight: FontWeight.normal),
        subtitle1: TextStyle(
            color: kBlack,
            fontFamily: 'SF Pro Rounded',
            fontSize: 14,
            fontWeight: FontWeight.w300)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
          color: kWhite.withOpacity(0.5),
          fontFamily: 'SF Pro Rounded',
          fontSize: 17,
          fontWeight: FontWeight.normal),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide.none),
      contentPadding: const EdgeInsets.all(12),
      filled: true,
      fillColor: const Color(0xff323232),
    ),
  );
}
