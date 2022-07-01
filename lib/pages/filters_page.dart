import 'package:flutter/material.dart';
import 'package:meals_app/views/filters_view.dart';

class FiltersPage extends StatefulWidget {
  final Map<String, bool> currentFilters;
  final Function(Map<String, bool>) changeFilter;
  const FiltersPage({Key? key, required this.changeFilter, required this.currentFilters}) : super(key: key);

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  late bool glutenFree;
  late bool vegetarian;
  late bool vegan;
  late bool lactoseFree;

  @override
  void initState() {
    glutenFree = widget.currentFilters['glutenFree']!;
    vegetarian = widget.currentFilters['vegetarian']!;
    vegan = widget.currentFilters['vegan']!;
    lactoseFree = widget.currentFilters['lactoseFree']!;
    super.initState();
  }

  void changeGlutenFree(bool newValue) {
    setState(() {
      glutenFree = newValue;
    });
  }
  void changeVegetarian(bool newValue) {
    setState(() {
      vegetarian = newValue;
    });
  }
  void changeVegan(bool newValue) {
    setState(() {
      vegan = newValue;
    });
  }
  void changeLactoseFree(bool newValue) {
    setState(() {
      lactoseFree = newValue;
    });
  }

  void changeFilter() {
    widget.changeFilter(
      {
        "vegan": vegan,
        "vegetarian": vegetarian,
        "lactoseFree": lactoseFree,
        "glutenFree": glutenFree
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
        actions: [
          IconButton(
            onPressed: () {
              changeFilter();
            },
            icon: const Icon(Icons.save)
          )
        ],
      ),
      body: FiltersView(
        glutenFree: glutenFree,
        vegetarian: vegetarian,
        vegan: vegan,
        lactoseFree: lactoseFree,
        changeGlutenFree: changeGlutenFree,
        changeLactoseFree: changeLactoseFree,
        changeVegan: changeVegan,
        changeVegetarian: changeVegetarian,
      ),
    );
  }
}
