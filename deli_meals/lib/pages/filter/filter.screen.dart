import 'package:deli_meals/widgets/main_drawer.widget.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const routName = '/filter';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      drawer: const MainDrawerWidget(),
      body: const Center(
        child: Text('Filter'),
      ),
    );
  }
}
