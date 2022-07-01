import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/pages/category_meals_page.dart';
import 'package:meals_app/pages/home_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name) {
    case categoryMealsRoute: return _navigateRoute(
      CategoryMealsPage(
        categoryId: (settings.arguments as Map<String, Object>)['id']! as String,
        categoryTitle: (settings.arguments as Map<String, Object>)['title']! as String,
        availableMeals: (settings.arguments as Map<String, Object>)['availableMeals']! as List<MealModel>,
      )
    );
    default: return _navigateRoute(
      HomePage(
        availableMeals: (settings.arguments as Map<String, List<MealModel>>)['available']!,
        favoriteMeals: (settings.arguments as Map<String, List<MealModel>>)['favorites']!,
      )
    );
  }
}

PageRoute _navigateRoute(Widget child) {
  return MaterialPageRoute(
      builder: (BuildContext context) => child
  );
}

const homeRoute = '/';
const categoryMealsRoute = '/category-meals';
const mealRoute = '/meal';
const filtersRoute = '/filters';