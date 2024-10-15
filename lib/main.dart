import 'package:flutter/material.dart';

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // AppBar
          SliverAppBar(
            title: Text("To-Do List"),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: SearchField(),
            ),
          ),
          // SizedBox
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          // Label Dropdown
          SliverToBoxAdapter(
            child: Row(
              children: [
                LabelDropdown(labelName: "Tasks"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LabelDropdown extends StatelessWidget {
  const LabelDropdown({
    super.key,
    required this.labelName,
  });

  final String labelName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Text(
            labelName,
            style: textTheme.labelMedium,
          ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              color: Colors.blue, // Define border color when focused
            ),
          ),
          hintText: "Search for your task...",
          hintStyle: TextStyle(color: theme.hintColor, fontSize: 16),
          prefixIcon: Icon(
            Icons.search,
            color: theme.hintColor,
          ),
          filled: true,
          fillColor: Color(0xFF1D1D1D),
        ),
      ),
    );
  }
}
