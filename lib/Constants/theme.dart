import 'package:flutter/material.dart';

var style = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 1,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      color: Colors.white,
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 15,
    )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.black,
    unselectedIconTheme: IconThemeData(
      color: Colors.grey
    ),
    selectedLabelStyle: TextStyle(
      fontSize: 10
    )
  )
);