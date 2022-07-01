import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';

class MealDetailView extends StatelessWidget {
  final MealModel meal;
  const MealDetailView({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(meal.imageUrl, fit: BoxFit.cover,),
          ),
          sectionTitle(context: context, text: "Ingredients"),
          buildContainer(
            context: context,
            child: ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Text(meal.ingredients[index]),
                );
              },
            ),
          ),
          sectionTitle(context: context, text: "Steps"),
          buildContainer(
            context: context,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.black54,
                );
              },
              itemCount: meal.steps.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text("# ${index + 1}"),
                  ),
                  title: Text(meal.steps[index]),
                );
              },

            )
          )
        ],
      ),
    );
  }

  Widget sectionTitle({required BuildContext context, required String text}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.headline4,),
    );
  }

  Widget buildContainer({required BuildContext context, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: MediaQuery.of(context).size.width * 0.85,
      child: child,
    );
  }
}
