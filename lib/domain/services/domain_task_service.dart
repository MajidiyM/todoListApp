import '../models/task_model/task_model.dart';

class TaskService {
  final List<Task> _tasks = [];

  Future<List<Task>> getTask() async {
    return _tasks;
  }

  Future<void> addTask(Task task) async {
    _tasks.add(task);
  }

  Future<void> updateTask(Task updatedTask) async {
    final index = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
    }
  }

  Future<void> deleteTask(String taskId) async {
    _tasks.removeWhere((task) => task.id == taskId);
  }
}

void main() {
  final taskService = TaskService();
}
