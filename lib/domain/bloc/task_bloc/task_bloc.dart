import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_list_app/domain/models/task_model/task_model.dart';
import 'package:todo_list_app/domain/services/domain_task_service.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskService taskService;
  TaskBloc(this.taskService) : super(TaskInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  Future<void> _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    try {
      final tasks = await taskService.getTask();
      emit(TaskLoaded(tasks));
    } catch (e, s) {
      emit(TaskError('Failed to load tasks ${e} ${s}'));
    }
  }

  Future<void> _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    try {
      await taskService.addTask(event.task);
      add(LoadTasks());
    } catch (e, s) {
      emit(TaskError('Failed t add task ${e} ${s}'));
    }
  }

  Future<void> _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    try {
      await taskService.updateTask(event.task);
      add(LoadTasks());
    } catch (e, s) {
      emit(TaskError("Failed to delete task ${e} ${s}"));
    }
  }

  Future<void> _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    try {
      await taskService.deleteTask(event.taskId);
      add(LoadTasks());
    } catch (e, s) {
      emit(TaskError("Failed to delete task ${e} ${s}"));
    }
  }
}
