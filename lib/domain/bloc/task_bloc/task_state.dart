part of 'task_bloc.dart';

@immutable
abstract class TaskState extends Equatable {}

class TaskInitial extends TaskState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TaskLoading extends TaskState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TaskLoaded extends TaskState {
  final List<Task> tasks;

  TaskLoaded(this.tasks);

  @override
  // TODO: implement props
  List<Object?> get props => [tasks];
}

class TaskError extends TaskState {
  final String message;

  TaskError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
