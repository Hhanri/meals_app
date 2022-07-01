import 'package:flutter/material.dart';
import 'package:meals_app/views/categories_view.dart';
import 'package:meals_app/views/favorites_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;

  final List<Map<String, Object>> pages = const [
    {'page': CategoriesView(), 'title': "Categories"},
    {'page': FavoritesView(), 'title': "Favorite"},
  ];

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
