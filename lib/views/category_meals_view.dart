import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/meal_item_widget.dart';

class CategoryMealsView extends StatelessWidget {
  final String categoryTitle;
  final String categoryId;
  const CategoryMealsView({Key? key, required this.categoryTitle, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MealModel> meals = mockMeals.where((element) => element.categories.contains(categoryId)).toList();
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final MealModel currentMeal = meals[index];
        return MealItemWidget(
          title: currentMeal.title,
          imageUrl: currentMeal.imageUrl,
          duration: currentMeal.duration,
          complexity: currentMeal.complexity,
          affordability: currentMeal.affordability
        );
      }
    );
  }
}
