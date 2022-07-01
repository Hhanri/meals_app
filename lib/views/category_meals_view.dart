import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/meal_item_widget.dart';

class CategoryMealsView extends StatefulWidget {
  final String categoryTitle;
  final String categoryId;
  const CategoryMealsView({Key? key, required this.categoryTitle, required this.categoryId}) : super(key: key);

  @override
  State<CategoryMealsView> createState() => _CategoryMealsViewState();
}

class _CategoryMealsViewState extends State<CategoryMealsView> {
  late List<MealModel> meals;

  @override
  void initState() {
    meals = mockMeals.where((element) => element.categories.contains(widget.categoryId)).toList();
    super.initState();
  }

  void removeMeal(MealModel meal) {
    setState(() {
      meals.removeWhere((element) => element.id == meal.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final MealModel currentMeal = meals[index];
        return MealItemWidget(
          meal: currentMeal,
          removeMeal: removeMeal,
        );
      }
    );
  }
}
