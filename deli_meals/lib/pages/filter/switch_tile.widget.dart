import 'package:flutter/material.dart';

class SwitchTile extends StatelessWidget {
  const SwitchTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.currentValue,
    required this.changedValue,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool currentValue;
  final Function changedValue;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: (val) => changedValue(val),
    );
  }
}
