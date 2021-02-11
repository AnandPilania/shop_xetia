import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    primaryColor: const Color(0xfffbb216),
    primaryColorDark: const Color(0xffF0F2F3),
    accentColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xffF0F2F3),
    iconTheme: IconThemeData(
      color: Colors.black,
      opacity: 1,
      size: 24,
    ),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: Color(0xfffbb216),
            fontSize: 24,
            fontWeight: FontWeight.w400),
        headline2: TextStyle(
            color: Colors.black, fontSize: 34, fontWeight: FontWeight.w700),
        headline3: TextStyle(
            color: Colors.black, fontSize: 50, fontWeight: FontWeight.w400),
        headline4: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        headline5: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
          color: const Color(0xffffffff).withOpacity(0.75),
          fontSize: 17,
          fontWeight: FontWeight.w600),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      filled: true,
      fillColor: Colors.black,
      contentPadding: const EdgeInsets.all(12),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    primaryColor: const Color(0xfffbb216),
    primaryColorDark: Colors.black,
    accentColor: Colors.black,
    scaffoldBackgroundColor: const Color(0xff616569),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: const Color(0xfffbb216),
            fontSize: 24,
            fontWeight: FontWeight.w400),
        headline2: TextStyle(
            color: const Color(0xffffffff),
            fontSize: 34,
            fontWeight: FontWeight.w700),
        headline3: TextStyle(
            color: const Color(0xffffffff),
            fontSize: 50,
            fontWeight: FontWeight.w400),
        headline4: TextStyle(
            color: const Color(0xffffffff),
            fontSize: 16,
            fontWeight: FontWeight.w700),
        headline5: TextStyle(
            color: const Color(0xffffffff),
            fontSize: 14,
            fontWeight: FontWeight.w400)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
          color: const Color(0xffffffff),
          fontSize: 17,
          fontWeight: FontWeight.w600),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      filled: true,
      fillColor: const Color.fromRGBO(194, 201, 209, 1),
      contentPadding: const EdgeInsets.all(12),
    ),
  );
}
