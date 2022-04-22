import 'package:deli_meals/pages/categories/categories.screen.dart';
import 'package:deli_meals/pages/categories/favorite/favorite.screen.dart';
import 'package:deli_meals/pages/meals/meals.model.dart';
import 'package:flutter/material.dart';

import '../../widgets/main_drawer.widget.dart';

class TabsScreenWidget extends StatefulWidget {
  static const routName = '/';

  final List<Meal> favoriteMeals;
  TabsScreenWidget(this.favoriteMeals);

  @override
  State<TabsScreenWidget> createState() => _TabsScreenWidgetState();
}

class _TabsScreenWidgetState extends State<TabsScreenWidget> {
  late List<Map<String, dynamic>> _pageList;
  int _selectedTab = 0;

  @override
  void initState() {
    _pageList = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Favorite'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${_pageList[_selectedTab]['title']}')),
      drawer: const MainDrawerWidget(),
      body: _pageList[_selectedTab]['page'] ?? Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        elevation: 4,
        selectedItemColor: Colors.amber,
        selectedFontSize: 12.0,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() => _selectedTab = index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
