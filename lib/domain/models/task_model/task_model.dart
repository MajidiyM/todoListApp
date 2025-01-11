import 'package:todo_list_app/domain/models/category_model/category.dart';
import 'package:todo_list_app/domain/models/priorities_model/priority.dart';

class Task {
  Task(
      {required this.id,
      required this.title,
      required this.startDate,
      required this.endDate,
      required this.category,
      required this.priority});

  final int id;
  final String title;
  final DateTime? startDate;
  final DateTime? endDate;
  final Category? category;
  final Priority? priority;
}
