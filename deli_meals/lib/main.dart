import 'package:deli_meals/pages/categories/categories.screen.dart';
import 'package:deli_meals/pages/categories/favorite/favorite.screen.dart';
import 'package:deli_meals/pages/filter/filter.screen.dart';
import 'package:deli_meals/pages/meals/detail/meal_detail.screen.dart';
import 'package:deli_meals/pages/meals/meals.screen.dart';
import 'package:deli_meals/pages/categories/tabs.widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dali Meals',
      theme: buildThemeData(),
      initialRoute: TabsScreenWidget.routName,
      routes: {
        TabsScreenWidget.routName: (ctx) => const TabsScreenWidget(),
        FilterScreen.routName: (ctx) => const FilterScreen(),
        FavoriteScreen.routName: (ctx) => const FavoriteScreen(),
        CategoriesScreen.routName: (ctx) => const CategoriesScreen(),
        MealsScreen.routName: (ctx) => const MealsScreen(),
        MealDetailScreen.routName: (ctx) => const MealDetailScreen(),
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
