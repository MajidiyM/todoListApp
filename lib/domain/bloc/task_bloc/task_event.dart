part of 'task_bloc.dart';

@immutable
abstract class TaskEvent extends Equatable {}

class LoadTasks extends TaskEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;

  AddTask(this.task);

  @override
  // TODO: implement props
  List<Object?> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;

  UpdateTask(this.task);

  @override
  // TODO: implement props
  List<Object?> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task taskId;

  DeleteTask(this.taskId);

  @override
  // TODO: implement props
  List<Object?> get props => [taskId];
}
