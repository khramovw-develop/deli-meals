import 'package:deli_meals/pages/meals/meal_item.widget.dart';
import 'package:flutter/material.dart';
import 'meals.model.dart';

class MealsScreen extends StatefulWidget {
  static const routName = '/meals';
  final List<Meal> availableMeals;
  const MealsScreen(this.availableMeals);

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  late String _categoryTitle;
  late Color _categoryColor;
  late List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routesArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      _categoryTitle = routesArgs['title'];
      _categoryColor = routesArgs['color'];
      final categoryId = routesArgs['id'];
      displayedMeals = widget.availableMeals.where((Meal meal) => meal.categories.contains(categoryId)).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
        backgroundColor: _categoryColor,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) => MealItem(meal: displayedMeals[index]),
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
