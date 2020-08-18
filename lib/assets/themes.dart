import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Color(0xff1da1f2),
  accentColor: Colors.cyan[600],
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Color(0xff2f3e46),
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
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 32.0,
      color: Color(0xff606266),
      fontWeight: FontWeight.normal,
    ),
    headline2: TextStyle(
      fontSize: 24.0,
      color: Color(0xff606266),
      fontWeight: FontWeight.normal,
    ),
    headline3: TextStyle(
      fontSize: 24.0,
      color: Color(0xff606266),
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
      color: Color(0xff606266),
      fontWeight: FontWeight.normal,
    ),
    headline2: TextStyle(
      fontSize: 24.0,
      color: Color(0xff606266),
      fontWeight: FontWeight.normal,
    ),
    headline3: TextStyle(
      fontSize: 24.0,
      color: Color(0xff606266),
      fontWeight: FontWeight.normal,
    ),
    headline5: TextStyle(
      fontSize: 24.0,
      color: Color(0xff606266),
      fontWeight: FontWeight.normal,
    ),
    headline6: TextStyle(
      fontSize: 24.0,
      color: Color(0xff606266),
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
