import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/views/categories_view.dart';
import 'package:meals_app/views/favorites_view.dart';
import 'package:meals_app/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  final List<MealModel> availableMeals;
  const HomePage({Key? key, required this.availableMeals}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;
  late List<Map<String, Object>> pages;
  @override
  void initState() {
    pages = [
      {'page': CategoriesView(availableMeals: widget.availableMeals,), 'title': "Categories"},
      {'page': const FavoritesView(), 'title': "Favorite"},
    ];
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    setState(() {
      pages = [
        {'page': CategoriesView(availableMeals: widget.availableMeals,), 'title': "Categories"},
        {'page': const FavoritesView(), 'title': "Favorite"},
      ];
    });
    print("update widget");
    super.didUpdateWidget(oldWidget);
  }

  void selectPage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[currentPage]['title'] as String),
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        //backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: selectPage,
        currentIndex: currentPage,
        type: BottomNavigationBarType.shifting,
        items: [
          bottomNavItem(icon: Icons.category, label: "Categories"),
          bottomNavItem(icon: Icons.star, label: "Favorites",),
        ],
      ),
      body: pages[currentPage]['page'] as Widget
    );
  }
  BottomNavigationBarItem bottomNavItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      backgroundColor: Theme.of(context).primaryColor,
      icon: Icon(icon),
      label: label
    );
  }
}
