import 'package:flutter/material.dart';

class Task {
  Task(
      {required this.id,
      required this.title,
      required this.startDate,
      required this.endDate,
      required this.category,
      required this.priority});

  final int id;
  final int title;
  final DateTime? startDate;
  final DateTime? endDate;
  final Widget category;
  final Widget priority;
}
