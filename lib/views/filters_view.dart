import 'package:flutter/material.dart';

class FiltersView extends StatelessWidget {
  final bool glutenFree;
  final bool vegetarian;
  final bool vegan;
  final bool lactoseFree;
  final Function(bool) changeGlutenFree;
  final Function(bool) changeVegetarian;
  final Function(bool) changeVegan;
  final Function(bool) changeLactoseFree;
  const FiltersView({
    Key? key,
    required this.glutenFree,
    required this.vegetarian,
    required this.vegan,
    required this.lactoseFree,
    required this.changeGlutenFree,
    required this.changeVegetarian,
    required this.changeVegan,
    required this.changeLactoseFree
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text("Adjust your meal selection:", style: Theme.of(context).textTheme.headline4,),
        ),
        Expanded(
          child: ListView(
            children: [
              SwitchListTile(
                title: const Text("Gluten Free"),
                value: glutenFree,
                onChanged: changeGlutenFree
              ),
              SwitchListTile(
                title: const Text("Vegetarian"),
                value: vegetarian,
                onChanged: changeVegetarian
              ),
              SwitchListTile(
                title: const Text("Vegan"),
                value: vegan,
                onChanged: changeVegan
              ),
              SwitchListTile(
                title: const Text("Lactose Free"),
                value: lactoseFree,
                onChanged: changeLactoseFree
              ),
            ],
          ),
        )
      ],
    );
  }
}
