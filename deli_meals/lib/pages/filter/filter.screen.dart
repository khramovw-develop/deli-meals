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
              children: <SwitchListTile>[
                buildSwitchListTile('Gluten-free', 'Only include gluten-free meals.', _glutenFree, (newValue) => setState(() => _glutenFree = newValue)),
                buildSwitchListTile('Vegetarian', 'Only include vegetarian meals.', _vegetarian, (newValue) => setState(() => _vegetarian = newValue)),
                buildSwitchListTile('Vegan', 'Only include vegan meals.', _vegan, (newValue) => setState(() => _vegan = newValue)),
                buildSwitchListTile('Lactose-free', 'Only include lactose-free meals.', _lactoseFree, (newValue) => setState(() => _lactoseFree = newValue)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function changedValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: (val) => changedValue(val),
    );
  }
}
