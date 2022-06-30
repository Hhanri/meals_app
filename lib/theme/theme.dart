import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  primaryColor: Colors.pink,
  primarySwatch: Colors.pink,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.amber
  ),
  appBarTheme:const AppBarTheme(
    color: Colors.pink
  ),
  canvasColor: const Color.fromRGBO(255, 254, 229, 1),
  fontFamily: 'Raleway',
  textTheme: ThemeData.light().textTheme.copyWith(
    bodyText1: const TextStyle(
      color: Color.fromRGBO(20, 51, 51, 1)
    ),
    bodyText2: const TextStyle(
      color: Color.fromRGBO(20, 51, 51, 1)
    ),
    headline4: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'RobotoCondensed',
    ),
  )
);