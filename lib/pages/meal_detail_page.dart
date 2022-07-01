import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/views/meal_detail_view.dart';

class MealDetailPage extends StatelessWidget {
  final Function(String) toggleFavorite;
  final Function(String) isFavorite;
  const MealDetailPage({Key? key, required this.toggleFavorite, required this.isFavorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final MealModel meal = ModalRoute.of(context)!.settings.arguments as MealModel;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),),
      body: MealDetailView(meal: meal),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(meal.id) ? Icons.star : Icons.star_border
        ),
        onPressed: () {
          toggleFavorite(meal.id);
        },
      ),
    );
  }
}
