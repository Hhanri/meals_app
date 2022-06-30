import 'package:meals_app/models/meal_model.dart';

class MealsUtils {
  static String complexityText(Complexity complexity) {
    switch(complexity) {
      case Complexity.challenging: return "Challenging";
      case Complexity.hard: return "Hard";
      case Complexity.simple: return "Simple";
    }
  }
  static String affordabilityText(Affordability affordability) {
    switch(affordability) {
      case Affordability.affordable: return "Affordable";
      case Affordability.pricey: return "Pricey";
      case Affordability.luxurious: return "Luxurious";
    }
  }
}