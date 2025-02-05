import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/data/services/tasks_service.dart';
import 'package:todo_list_app/domain/bloc/task_bloc/task_bloc.dart';
import 'package:todo_list_app/domain/services/domain_task_service.dart';
import 'package:todo_list_app/router/router.dart';

import 'data/services/categories_service.dart';
import 'data/services/priorities_services.dart';
import 'ui/theme/theme.dart';

void main() {
  final categoriesService = CategoriesServiceImpl();
  final prioritiesServices = PrioritiesServiceImpl();

  final TaskService taskService = TaskServiceImpl(
      categoriesService: categoriesService,
      prioritiesServices: prioritiesServices);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(
            create: (context) => TaskBloc(taskService)..add(LoadTasks())),
      ],
      child: const ToDoListApp(),
    ),
  );
}

class ToDoListApp extends StatefulWidget {
  const ToDoListApp({super.key});

  @override
  State<ToDoListApp> createState() => _ToDoListAppState();
}

class _ToDoListAppState extends State<ToDoListApp> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "To-Do List",
      theme: darkTheme,
      routerConfig: _router.config(),
    );
  }
}
