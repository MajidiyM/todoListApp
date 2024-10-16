import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/detailed_task_screen/detailed_screen.dart';
import 'package:todo_list_app/screens/settings_screen/settings.dart';
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
      theme: darkTheme,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: PageView(
        children: [
          TasksScreen(),
          DetailedTaskScreen(),
          SettingsScreen(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AddTask(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class AddTask extends StatelessWidget {
  const AddTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 64,
      width: 64,
      child: FloatingActionButton(
        backgroundColor: theme.floatingActionButtonTheme.backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {},
      ),
    );
  }
}
