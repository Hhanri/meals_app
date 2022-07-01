import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/pages/filters_page.dart';
import 'package:meals_app/pages/home_page.dart';
import 'package:meals_app/pages/meal_detail_page.dart';
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
  List<MealModel> favorites = [];

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

  void toggleFavorite(String mealId) {
    final index = favorites.indexWhere((element) => element.id == mealId);
    if (index >= 0) {
      setState(() {
        favorites.removeAt(index);
      });
    } else {
      setState(() {
        favorites.add(mockMeals.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isFavorite(String mealId) {
    return favorites.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      routes: {
        '/': (context) => HomePage(availableMeals: availableMeals, favoriteMeals: favorites,),
        filtersRoute: (context) => FiltersPage(
          changeFilter: saveFilter,
          currentFilters: filters,
        ),
        mealRoute: (context) => MealDetailPage(toggleFavorite: toggleFavorite, isFavorite: isFavorite,)
      },
      onGenerateRoute: generateRoute,
    );
  }
}