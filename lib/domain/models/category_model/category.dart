import 'package:flutter/material.dart';

class Category {
  Category(
      {
      required this.id,
      required this.icon,
      required this.iconColor,
      required this.label,
      required this.color});

  final int id;
  final IconData icon;
  final Color iconColor;
  final String label;
  final Color color;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'] as int,
        icon: json['icon'] ,
        iconColor: json['iconColor'],
        label: json['label'],
        color: json['color']);
  }
}
