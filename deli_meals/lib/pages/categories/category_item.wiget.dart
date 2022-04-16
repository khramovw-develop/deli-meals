import 'package:deli_meals/pages/meals/meals.screen.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;
  const CategoryItem({Key? key, required this.title, required this.color, required this.id}) : super(key: key);

  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(
    //   builder: (_) => MealsScreen(id, title, color),
    // ));
    Navigator.pushNamed(ctx, MealsScreen.routName, arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
          gradient: kLinearGradient(color),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
