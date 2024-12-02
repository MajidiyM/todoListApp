import 'package:flutter/material.dart';

class Priority {
  Priority(
      {required this.icon,
      required this.iconColor,
      required this.label,
      required this.color});

  final IconData icon;
  final Color iconColor;
  final String label;
  final Color color;
}
