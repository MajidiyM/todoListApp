import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/tasks_screen/tasks_screen.dart';

import 'ui/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To-Do List",
      home: TasksScreen(),
      theme: darkTheme,
    );
  }
}
