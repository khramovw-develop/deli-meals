import 'package:deli_meals/pages/meals/meal_item.widget.dart';
import 'package:flutter/material.dart';

import '../../meals/meals.model.dart';

class FavoriteScreen extends StatelessWidget {
  static const routName = '/favorite';

  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text(
          'You have no Favorite yet. Start adding some!',
          style: TextStyle(color: Colors.black87),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meal: favoriteMeals[index]);
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
