import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/meal_item_widget.dart';

class FavoritesView extends StatelessWidget {
  final List<MealModel> favorites;
  const FavoritesView({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favorites.isNotEmpty) {
      return ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItemWidget(meal: favorites[index]);
        },
      );
    }
    return const Center(
      child: Text("No favorite yet!"),
    );
  }
}
