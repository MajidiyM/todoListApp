import 'package:flutter/material.dart';

import 'screens/home_screen/home_screen.dart';
import 'ui/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To-Do List",
      home: HomeScreen(),
      theme: darkTheme,
    );
  }
}
