import 'package:flutter/material.dart';

class MainDrawerListTile extends StatelessWidget {
  const MainDrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(color: Colors.black87)),
      onTap: () => onTap(),
    );
  }
}
