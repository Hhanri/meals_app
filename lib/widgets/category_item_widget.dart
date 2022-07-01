import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/routing/routing.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel category;
  final List<MealModel> availableMeals;
  const CategoryItemWidget({Key? key, required this.category, required this.availableMeals}) : super(key: key);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      categoryMealsRoute,
      arguments: {
        'id': category.id,
        'title': category.title,
        'availableMeals': availableMeals
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(20);
    return InkWell(
      onTap: () {
        _selectCategory(context);
      },
      borderRadius: borderRadius,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: LinearGradient(
            colors: [category.color.withOpacity(.7), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
