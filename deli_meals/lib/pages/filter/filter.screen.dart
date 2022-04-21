import 'package:deli_meals/pages/filter/switch_tile.widget.dart';
import 'package:deli_meals/widgets/main_drawer.widget.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routName = '/filter';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter')),
      drawer: const MainDrawerWidget(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <SwitchTile>[
                SwitchTile(
                  title: 'Gluten-free',
                  subtitle: 'Only include gluten-free meals.',
                  currentValue: _glutenFree,
                  changedValue: (newValue) => setState(() => _glutenFree = newValue),
                ),
                SwitchTile(
                  title: 'Vegetarian',
                  subtitle: 'Only include vegetarian meals.',
                  currentValue: _vegetarian,
                  changedValue: (newValue) => setState(() => _vegetarian = newValue),
                ),
                SwitchTile(
                  title: 'Vegan',
                  subtitle: 'Only include vegan meals.',
                  currentValue: _vegan,
                  changedValue: (newValue) => setState(() => _vegan = newValue),
                ),
                SwitchTile(
                  title: 'Lactose-free',
                  subtitle: 'Only include lactose-free meals.',
                  currentValue: _lactoseFree,
                  changedValue: (newValue) => setState(() => _lactoseFree = newValue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
