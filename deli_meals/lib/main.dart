import 'package:deli_meals/pages/categories/categories.screen.dart';
import 'package:deli_meals/pages/categories/favorite/favorite.screen.dart';
import 'package:deli_meals/pages/filter/filter.screen.dart';
import 'package:deli_meals/pages/meals/detail/meal_detail.screen.dart';
import 'package:deli_meals/pages/meals/meals.data.dart';
import 'package:deli_meals/pages/meals/meals.model.dart';
import 'package:deli_meals/pages/meals/meals.screen.dart';
import 'package:deli_meals/pages/categories/tabs.widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if ((_filters['gluten'] ?? false) && !meal.isGlutenFree) {
          return false;
        }
        if ((_filters['lactose'] ?? false) && !meal.isLactoseFree) {
          return false;
        }
        if ((_filters['vegan'] ?? false) && !meal.isVegan) {
          return false;
        }
        if ((_filters['vegetarian'] ?? false) && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() => _favoriteMeals.removeAt(existingIndex));
    } else {
      setState(() => _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId)));
    }
  }

  bool _isMealFavorite(String mealId) => _favoriteMeals.any((meal) => meal.id == mealId);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dali Meals',
      theme: buildThemeData(),
      initialRoute: TabsScreenWidget.routName,
      routes: {
        TabsScreenWidget.routName: (ctx) => TabsScreenWidget(_favoriteMeals),
        FilterScreen.routName: (ctx) => FilterScreen(_filters, _setFilters),
        FavoriteScreen.routName: (ctx) => FavoriteScreen(_favoriteMeals),
        CategoriesScreen.routName: (ctx) => const CategoriesScreen(),
        MealsScreen.routName: (ctx) => MealsScreen(_availableMeals),
        MealDetailScreen.routName: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
      },
      onUnknownRoute: (_) => MaterialPageRoute(builder: (BuildContext ctx) => const CategoriesScreen()),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),
      canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      fontFamily: 'Railway',
      textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
            bodyText2: const TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
            headline1: const TextStyle(fontSize: 20.0, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold),
            headline2: const TextStyle(fontSize: 18.0, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.w600),
            headline3: const TextStyle(fontSize: 16.0, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.w500),
          ),
    );
  }
}
