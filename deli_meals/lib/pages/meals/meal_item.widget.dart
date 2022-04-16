import 'package:deli_meals/pages/meals/detail/meal_detail.screen.dart';
import 'package:flutter/material.dart';

import 'meals.model.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(ctx) {
    Navigator.pushNamed(ctx, MealDetailScreen.routName, arguments: meal.id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 4,
      margin: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () => selectMeal(context),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 10.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    color: Colors.black45,
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                    child: Text(
                      meal.title,
                      style: const TextStyle(color: Colors.white, fontSize: 26.0),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule, color: Colors.black54),
                      const SizedBox(width: 6.0),
                      Text(
                        '${meal.duration} min',
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work, color: Colors.black54),
                      const SizedBox(width: 6.0),
                      Text(
                        complexityText,
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money, color: Colors.black54),
                      const SizedBox(width: 6.0),
                      Text(
                        affordabilityText,
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
