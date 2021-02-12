import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    primaryColor: const Color(0xfffbb216),
    primaryColorDark: const Color(0xffF0F2F3),
    primaryColorLight: Colors.black,
    accentColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xffF0F2F3),
    iconTheme: IconThemeData(color: Colors.black, opacity: 1, size: 24),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(foregroundColor: Colors.white),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: Colors.black,
            fontSize: 34,
            fontFamily: 'SF Pro Rounded',
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1),
        headline2: TextStyle(
            color: Color(0xfffbb216),
            fontFamily: 'SF Pro Rounded',
            fontSize: 24,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1),
        headline3: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'SF Pro Rounded',
            fontSize: 20,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.4),
        headline4: TextStyle(
            color: const Color.fromRGBO(194, 201, 209, 1),
            fontSize: 16.5,
            fontWeight: FontWeight.normal,
            height: 1.5,
            letterSpacing: 0,
            fontFamily: 'SF Pro Rounded'),
        headline5: TextStyle(
            color: Color.fromRGBO(194, 201, 209, 1),
            fontFamily: 'SF Pro Rounded',
            fontSize: 13.5,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.5),
        subtitle1: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'SF Pro Rounded',
            fontSize: 12,
            letterSpacing: 0,
            fontWeight: FontWeight.bold,
            height: 1.3333333333333333),
        subtitle2: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'SF Pro Text',
            fontSize: 11,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.4545454545454546),
        bodyText1: TextStyle(
            color: Color.fromRGBO(251, 178, 22, 1),
            fontFamily: 'SF Pro Text',
            fontSize: 11.744000434875488,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.333333360401745)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
          color: const Color(0xffffffff).withOpacity(0.75),
          fontSize: 17,
          fontWeight: FontWeight.w600),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      filled: true,
      fillColor: Colors.black,
      contentPadding: const EdgeInsets.all(12),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    primaryColor: const Color(0xfffbb216),
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,
    accentColor: Colors.black,
    scaffoldBackgroundColor: const Color(0xff616569),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(foregroundColor: Colors.black),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: const Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'SF Pro Rounded',
            fontSize: 34,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1),
        headline2: TextStyle(
            color: const Color.fromRGBO(251, 178, 22, 1),
            fontFamily: 'SF Pro Rounded',
            fontSize: 24,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1),
        headline3: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'SF Pro Rounded',
            fontSize: 20,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.4),
        headline4: TextStyle(
            color: const Color.fromRGBO(194, 201, 209, 1),
            fontSize: 16.5,
            fontWeight: FontWeight.normal,
            height: 1.5,
            letterSpacing: 0,
            fontFamily: 'SF Pro Rounded'),
        headline5: TextStyle(
            color: Color.fromRGBO(194, 201, 209, 1),
            fontFamily: 'SF Pro Rounded',
            fontSize: 13.5,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.5),
        subtitle1: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'SF Pro Rounded',
            fontSize: 12,
            letterSpacing: 0,
            fontWeight: FontWeight.bold,
            height: 1.3333333333333333),
        subtitle2: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'SF Pro Text',
            fontSize: 11,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.4545454545454546),
        bodyText1: TextStyle(
            color: Color.fromRGBO(251, 178, 22, 1),
            fontFamily: 'SF Pro Text',
            fontSize: 11.744000434875488,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.333333360401745)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.75),
          fontFamily: 'SF Pro Rounded',
          fontSize: 17,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      filled: true,
      fillColor: const Color.fromRGBO(194, 201, 209, 1),
      contentPadding: const EdgeInsets.all(12),
    ),
  );
}
