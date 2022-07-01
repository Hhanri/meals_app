import 'package:flutter/material.dart';
import 'package:meals_app/routing/routing.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            height: 120,
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          drawerButton(
            icon: Icons.restaurant,
            text: "Meals", onTap: () {
              Navigator.of(context).pushReplacementNamed(homeRoute);
          }),
          drawerButton(
            icon: Icons.settings,
            text: "Filters", onTap: () {
              Navigator.of(context).pushNamed(filtersRoute);
          }),
        ],
      ),
    );
  }

  Widget drawerButton({required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, size: 26,),
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
      ),
      onTap: onTap,
    );
  }
}
