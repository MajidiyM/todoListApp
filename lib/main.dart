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
          ),
          // SizedBox
          SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          // TaskCard
          SliverToBoxAdapter(
            child: TaskCard(
              title: 'Do math homework',
              startDate: '15.10.24',
              endDate: '20.10.24',
              category: 'University',
              priority: '2',
            ),
          ),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.category,
    required this.priority,
  });

  final String title;
  final String startDate;
  final String endDate;
  final String category;
  final String priority;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Radio(
            value: null,
            groupValue: null,
            onChanged: null,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            startDate,
                            style: theme.textTheme.bodyMedium,
                          ),
                          Container(
                            width: 2,
                            height: 15,
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(vertical: 4),
                          ),
                          Text(
                            endDate,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          backgroundColor: Color(0xFF809CFF),
                          iconColor: Color(0xFF0055A3),
                        ),
                        onPressed: () {},
                        label: Text(
                          category,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        icon: Icon(Icons.school_outlined),
                      ),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: BorderSide(
                            color: Color(0xFF8687E7),
                          ),
                          iconColor: Colors.white,
                        ),
                        onPressed: () {},
                        label: Text(
                          priority,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        icon: Icon(Icons.outlined_flag_rounded),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
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
            style: theme.textTheme.titleMedium,
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
