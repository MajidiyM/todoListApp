import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/domain/bloc/task_bloc/task_bloc.dart';

import '../widgets/widgets.dart';

@RoutePage()
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TaskBloc>().add(LoadTasks());

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
          // SizedBox
          SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),

          BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
            if (state is TaskLoading) {
              return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state is TaskLoaded) {
              if (state.tasks.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(child: Text("No tasks available")),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.tasks.length,
                  (context, index) {
                    final task = state.tasks[index];
                    final dateFormat = DateFormat("dd.MM.yyyy");
                    return TaskCard(
                      title: task.title?.toString(),
                      startDate: task.startDate != null
                          ? dateFormat.format(task.startDate!)
                          : null,
                      endDate: task.endDate != null
                          ? dateFormat.format(task.endDate!)
                          : null,
                      category: task.category?.toString(),
                      priority: task.priority?.toString(),
                    );
                  },
                ),
              );
            } else if (state is TaskError) {
              return SliverToBoxAdapter(
                child: Center(child: Text(state.message)),
              );
            }
            return const SliverToBoxAdapter(
              child: SizedBox(),
            );
          })
        ],
      ),
    );
  }
}
