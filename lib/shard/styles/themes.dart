import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    // ignore: deprecated_member_use
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    iconTheme:IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    backgroundColor: HexColor('333739'),
    unselectedItemColor: Colors.grey,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      fontSize: 17.0,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      fontSize: 16.0,
      color: Colors.white,
      height: 1.4,
    ),
  ),
);
ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    // ignore: deprecated_member_use
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme:IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      fontSize: 17.0,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
      color: Colors.black,
      height: 1.4,
    ),
  ),
);