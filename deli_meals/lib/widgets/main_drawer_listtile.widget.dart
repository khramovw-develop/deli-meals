import 'package:flutter/material.dart';

class MainDrawerListTile extends StatelessWidget {
  const MainDrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.routName,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final String routName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(color: Colors.black87)),
      onTap: () => Navigator.of(context).pushReplacementNamed(routName),
    );
  }
}
