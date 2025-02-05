import 'package:todo_list_app/domain/models/task_model/task_model.dart';

abstract class TaskService {
  Future<List<Task>> getTask();
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(int id);
}