import 'package:flutter/material.dart';
import 'package:meals_app/routing/routing.dart';
import 'package:meals_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      onGenerateRoute: generateRoute,
    );
  }
}