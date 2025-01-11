import 'package:flutter/material.dart';

class CategoryTask extends StatelessWidget {
  const CategoryTask({
    super.key,
    required this.category,
    required this.iconColor,
    required this.color,
    this.icon,
  });

  final String? category;
  final Color? color;
  final Color? iconColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        backgroundColor: color,
      ),
      onPressed: () {},
      label: Text(
        category ?? "",
        style: TextStyle(color: iconColor, fontSize: 14),
      ),
      icon: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
