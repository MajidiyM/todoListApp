import 'package:sqflite/sqflite.dart';
import 'package:todo_list_app/domain/models/task_model/task_model.dart';
import 'package:todo_list_app/domain/models/category_model/category.dart';
import 'package:todo_list_app/domain/models/priorities_model/priority.dart';
import 'package:todo_list_app/domain/services/domain_task_service.dart';
import 'package:todo_list_app/domain/services/domain_categories_services.dart';
import 'package:todo_list_app/domain/services/domain_priorities_services.dart';

import '../data_sources/local_database_provider.dart';

class TaskServiceImpl implements TaskService {
  final CategoriesService categoriesService;
  final PrioritiesServices prioritiesServices;

  TaskServiceImpl({
    required this.categoriesService,
    required this.prioritiesServices,
  });

  Future<Database> get _db async => await DatabaseProvider.instance.database;

  @override
  Future<void> addTask(Task task) async {
    final db = await _db;
    await db.insert('tasks', {
      'title': task.title,
      'startDate': task.startDate?.millisecondsSinceEpoch,
      'endDate': task.endDate?.millisecondsSinceEpoch,
      // Сохраняем лишь идентификатор (label) для Category и Priority
      'category': task.category?.id,
      'priority': task.priority?.id,
    });
  }

  @override
  Future<void> deleteTask(int id) async {
    final db = await _db;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<Task>> getTask() async {
    final db = await _db;
    final result = await db.query('tasks');

    // Получаем списки категорий и приоритетов для восстановления объектов
    final categories = await categoriesService.getCategories();
    final priorities = await prioritiesServices.getPriorirties();

    List<Task> tasks = result.map((json) {
      Category? category;
      if (json['category'] != null) {
        // Ищем объект по id
        category = categories.firstWhere(
          (cat) => cat.id == json['category'],
          orElse: () => categories.first,
        );
      }

      Priority? priority;
      if (json['priority'] != null) {
        priority = priorities.firstWhere(
          (pri) => pri.id == json['priority'],
          orElse: () => priorities.first,
        );
      }

      return Task(
        id: json['id'] as int,
        title: json['title'] as String,
        startDate: json['startDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['startDate'] as int)
            : null,
        endDate: json['endDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['endDate'] as int)
            : null,
        category: category,
        priority: priority,
      );
    }).toList();

    return tasks;
  }

  @override
  Future<void> updateTask(Task task) async {
    final db = await _db;
    await db.update(
      'tasks',
      {
        'title': task.title,
        'startDate': task.startDate?.millisecondsSinceEpoch,
        'endDate': task.endDate?.millisecondsSinceEpoch,
        'category': task.category?.id,
        'priority': task.priority?.id,
      },
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }
}
