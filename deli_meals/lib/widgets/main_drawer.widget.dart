import 'package:deli_meals/pages/categories/tabs.widget.dart';
import 'package:deli_meals/pages/filter/filter.screen.dart';
import 'package:flutter/material.dart';

import 'main_drawer_listtile.widget.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Cooking now!'),
          ),
          const SizedBox(height: 10),
          MainDrawerListTile(
            title: 'Meals',
            icon: Icons.restaurant,
            onTap: () => Navigator.of(context).pushNamed(TabsScreenWidget.routName),
          ),
          const Divider(endIndent: 20, indent: 20),
          MainDrawerListTile(
            title: 'Filter',
            icon: Icons.settings,
            onTap: () => Navigator.of(context).pushNamed(FilterScreen.routName),
          ),
        ],
      ),
    );
  }
}
