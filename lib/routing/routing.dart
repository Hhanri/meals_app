import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/pages/category_meals_page.dart';
import 'package:meals_app/pages/home_page.dart';
import 'package:meals_app/pages/meal_detail_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name) {
    case homeRoute: return _navigateRoute(const HomePage());
    case categoryMealsRoute: return _navigateRoute(
      CategoryMealsPage(
        categoryId: (settings.arguments as Map<String, String>)['id']!,
        categoryTitle: (settings.arguments as Map<String, String>)['title']!
      )
    );
    case mealRoute: return _navigateRoute(
      MealDetailPage(meal: settings.arguments as MealModel)
    );
    default: return _navigateRoute(const HomePage());
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