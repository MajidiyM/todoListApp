import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

@RoutePage()
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

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
          SliverList.builder(
            itemCount: 5,
            itemBuilder: (context, index) => TaskCard(
              title: "Take out dog",
              startDate: "15.10.24",
              endDate: "15.10.24",
              category: "Home",
              //priority: "4",
            ),
          ),
        ],
      ),
    );
  }
}
