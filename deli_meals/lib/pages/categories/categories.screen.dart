import 'package:flutter/material.dart';

import 'category_item.wiget.dart';
import 'dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routName = '/categories';
  const CategoriesScreen({Key? key}) : super(key: key);

  get gridDelegate => const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      );

  get categoriesList => DUMMY_CATEGORIES
      .map((item) => CategoryItem(
            title: item.title,
            color: item.color,
            id: item.id,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView(
          gridDelegate: gridDelegate,
          children: categoriesList,
          padding: const EdgeInsets.all(25.0),
        ),
      ),
    );
  }
}
