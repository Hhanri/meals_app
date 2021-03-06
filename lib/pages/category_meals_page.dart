import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/views/category_meals_view.dart';

class CategoryMealsPage extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final List<MealModel> availableMeals;
  const CategoryMealsPage({
    Key? key,
    required this.categoryId,
    required this.categoryTitle,
    required this.availableMeals
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: CategoryMealsView(categoryTitle: categoryTitle, categoryId: categoryId, availableMeals: availableMeals,),
    );
  }
}
