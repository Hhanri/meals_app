import 'package:flutter/material.dart';
import 'package:meals_app/views/categories_view.dart';

class CategoryMealsPage extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  const CategoryMealsPage({
    Key? key,
    required this.categoryId,
    required this.categoryTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: const Text('hhah'),
    );
  }
}