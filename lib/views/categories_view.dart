import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/category_item_widget.dart';

class CategoriesView extends StatelessWidget {
  final List<MealModel> availableMeals;
  const CategoriesView({Key? key, required this.availableMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(25),
      itemCount: mockCategories.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
      itemBuilder: (context, index) {

        final currentCategory = mockCategories[index];
        return CategoryItemWidget(category: currentCategory, availableMeals: availableMeals,);
      }
    );
  }
}
