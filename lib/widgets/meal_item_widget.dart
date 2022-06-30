import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/utils.dart';

class MealItemWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItemWidget({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(15);
    const  BorderRadius imageRadius = BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15));
    return InkWell(
      borderRadius: borderRadius,
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: imageRadius,
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconTextWidget(icon: Icons.schedule, text: '$duration min'),
                  IconTextWidget(icon: Icons.work, text: MealsUtils.complexityText(complexity)),
                  IconTextWidget(icon: Icons.money, text: MealsUtils.affordabilityText(affordability)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconTextWidget({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor,),
        const SizedBox(width: 6,),
        Text(text)
      ],
    );
  }
}
