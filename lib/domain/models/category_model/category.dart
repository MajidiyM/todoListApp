import 'package:flutter/material.dart';

class Category {
  Category(
      {required this.icon,
      required this.iconColor,
      required this.label,
      required this.color});

  final IconData icon;
  final Color iconColor;
  final String label;
  final Color color;
}
