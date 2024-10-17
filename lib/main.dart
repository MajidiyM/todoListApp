import 'package:flutter/material.dart';
import 'package:todo_list_app/router/router.dart';

import 'ui/theme/theme.dart';

void main() => runApp(ToDoListApp());

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
