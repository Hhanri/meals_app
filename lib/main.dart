import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/pages/filters_page.dart';
import 'package:meals_app/pages/home_page.dart';
import 'package:meals_app/routing/routing.dart';
import 'package:meals_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late List<MealModel> availableMeals;

  @override
  void initState() {
    availableMeals = mockMeals;
    super.initState();
  }

  Map<String, bool> filters = {
    "vegan": false,
    "vegetarian": false,
    "lactoseFree": false,
    "glutenFree": false
  };

  void saveFilter(Map<String, bool> newFilters) {
    print("SAVING");
    setState(() {
      filters = newFilters;
      availableMeals = [...availableMeals.where((element) {
        if (filters['glutenFree']! && !element.isGlutenFree) {
          return false;
        }
        if (filters['vegan']! && !element.isVegan) {
          return false;
        }
        if (filters['vegetarian']! && !element.isVegan) {
          return false;
        }
        if (filters['lactoseFree']! && !element.isLactoseFree) {
          return false;
        }
        return true;
      }).toList()];
    });
    print("SAVED");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      routes: {
        '/': (context) => HomePage(availableMeals: availableMeals),
        filtersRoute: (context) => FiltersPage(
          changeFilter: saveFilter,
          currentFilters: filters,
        ),
      },
      onGenerateRoute: generateRoute,
    );
  }
}