import 'package:ashtree/assets/color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Color(0xff1da1f2),
  accentColor: Colors.cyan[600],
  textSelectionColor: Colors.black,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Color(0xffebeef5),
    filled: true,
    focusColor: Colors.black,
    hoverColor: Colors.black,
    errorStyle: TextStyle(height: 1),
    helperStyle: TextStyle(height: 1),
    contentPadding: EdgeInsets.only(left: 12.0, right: 12.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
      borderSide: BorderSide.none,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xff1da1f2),
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 32.0,
      color: Color(0xff1da1f2),
      fontWeight: FontWeight.normal,
    ),
    bodyText1: TextStyle(
      fontSize: 18.0,
      color: Color(0xff303133),
      fontWeight: FontWeight.normal,
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      color: Color(0xff303133),
      fontWeight: FontWeight.normal,
    ),
  ),
);

ThemeData lightTheme = ThemeData.light().copyWith(
  backgroundColor: Color(0xfff6f6f6),
  primaryColor: Color(0xff1da1f2),
  accentColor: Colors.cyan[600],
  textSelectionColor: Colors.black,
  colorScheme: ColorScheme.light(
    secondary: Colors.black12,
    primary: Color(0xff1da1f2),
    error: Color(0xfff56c6c),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Color(0xffebeef5),
    filled: true,
    focusColor: Colors.black,
    hoverColor: Colors.black,
    errorStyle: TextStyle(height: 1),
    helperStyle: TextStyle(height: 1),
    contentPadding:
        EdgeInsets.only(left: 12.0, right: 12.0, top: 12, bottom: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
      borderSide: BorderSide.none,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xff1da1f2),
    textTheme: ButtonTextTheme.primary,
    padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 32.0,
      color: Color(0xff1da1f2),
      fontWeight: FontWeight.normal,
    ),
    headline6: TextStyle(
      fontSize: 18.0,
      color: Color(0xff303133),
      fontWeight: FontWeight.normal,
    ),
    bodyText1: TextStyle(
      fontSize: 18.0,
      color: Color(0xff303133),
      fontWeight: FontWeight.normal,
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      color: Color(0xff303133),
      fontWeight: FontWeight.normal,
    ),
  ),
);
