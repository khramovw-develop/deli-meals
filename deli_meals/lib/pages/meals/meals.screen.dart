import 'package:deli_meals/pages/meals/meal_item.widget.dart';
import 'package:flutter/material.dart';
import 'meals.data.dart';
import 'meals.model.dart';

class MealsScreen extends StatelessWidget {
  static const routName = '/meals';
  const MealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routesArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final categoryTitle = routesArgs['title'];
    final categoryColor = routesArgs['color'];
    final categoryId = routesArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((Meal meal) => meal.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) => MealItem(meal: categoryMeals[index]),
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
