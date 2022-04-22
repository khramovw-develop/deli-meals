import 'package:deli_meals/pages/filter/switch_tile.widget.dart';
import 'package:deli_meals/widgets/main_drawer.widget.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routName = '/filter';

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  const FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late bool _glutenFree = false;
  late bool _vegetarian = false;
  late bool _vegan = false;
  late bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              widget.saveFilters({
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              });
            },
          ),
        ],
      ),
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
