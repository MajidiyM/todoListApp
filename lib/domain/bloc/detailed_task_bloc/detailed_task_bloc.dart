import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'detailed_task_event.dart';
part 'detailed_task_state.dart';

class DetailedTaskBloc extends Bloc<DetailedTaskEvent, DetailedTaskState> {
  DetailedTaskBloc() : super(DetailedTaskInitial()) {
    on<DetailedTaskEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
