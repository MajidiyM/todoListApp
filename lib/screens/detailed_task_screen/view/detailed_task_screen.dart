import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/domain/bloc/task_bloc/task_bloc.dart';
import 'package:todo_list_app/router/router.dart';
import 'package:todo_list_app/screens/detailed_task_screen/dialogs/show_date_range_picker.dart';
import 'package:todo_list_app/screens/detailed_task_screen/dialogs/show_priority_dialog.dart';
import 'package:todo_list_app/screens/detailed_task_screen/widgets/tile_detailed_card.dart';

import '../../../domain/models/category_model/category.dart';
import '../../../domain/models/priorities_model/priority.dart';
import '../../../domain/models/task_model/task_model.dart';
import '../dialogs/show_category_dialog.dart';
import '../widgets/datepicker_button.dart';
import '../widgets/task_content.dart';

@RoutePage()
class DetailedTaskScreen extends StatefulWidget {
  const DetailedTaskScreen({super.key});

  @override
  _DetailedTaskScreenState createState() => _DetailedTaskScreenState();
}

class _DetailedTaskScreenState extends State<DetailedTaskScreen> {
  DateTime? _startDate;
  DateTime? _endDate;
  Category? selectedCategory;
  Priority? selectedPriority;
  late String _taskTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  context.router.replaceAll([const HomeRoute()]);
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    final newTask = Task(
                      id: 0, // id генерируется базой данных
                      title: _taskTitle,
                      startDate: _startDate,
                      endDate: _endDate,
                      category: selectedCategory,
                      priority: selectedPriority,
                    );
                    context.read<TaskBloc>().add(AddTask(newTask));
                    context.router.replaceAll([const HomeRoute()]);
                  },
                  icon: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            // Task text
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Radio(value: null, groupValue: null, onChanged: null),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: theme.primaryColor,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: TaskContent(
                        onTextChanged: (text) {
                          setState(() {
                            _taskTitle = text;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            // Start date
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Start Date:",
                      style: theme.textTheme.titleLarge,
                    ),
                    Spacer(),
                    DatePickerButton(
                      displayText: formateDate(_startDate),
                      onPressed: () => Utils().showDateRangePicker(context,
                          onDateSelected: (start, end) {
                        setState(() {
                          _startDate = start;
                          _endDate = end;
                        });
                      }),
                    ),
                  ],
                ),
              ),
            ),
            //SizedBox
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            //End Date
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "End Date:",
                      style: theme.textTheme.titleLarge,
                    ),
                    Spacer(),
                    DatePickerButton(
                      displayText: formateDate(_endDate),
                      onPressed: () => Utils().showDateRangePicker(
                        context,
                        onDateSelected: (start, end) {
                          setState(() {
                            _startDate = start;
                            _endDate = end;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.0,
              ),
            ),
            // Task Category
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TileDetailedCard(
                  icon: Icons.category_outlined,
                  title: "Task Categories",
                  buttonTitle: selectedCategory?.label ?? "Select Categories",
                  buttonColor: selectedCategory?.color,
                  buttonIcon: selectedCategory?.icon,
                  buttonIconColor: selectedCategory?.iconColor ?? Colors.white,
                  onTap: () async {
                    final category = await showCategoryDialog(context);
                    if (category != null) {
                      setState(() {
                        selectedCategory = category;
                      });
                    }
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.0,
              ),
            ),
            // Task Priority
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TileDetailedCard(
                  icon: Icons.flag_outlined,
                  title: "Task Priority",
                  buttonTitle: selectedPriority?.label ?? "Select Priority",
                  buttonColor: selectedPriority?.color,
                  buttonIcon: selectedPriority?.icon,
                  buttonIconColor: selectedPriority?.iconColor ?? Colors.white,
                  onTap: () async {
                    final priority = await showPriorityDialog(context);
                    if (priority != null) {
                      setState(() {
                        selectedPriority = priority;
                      });
                    }
                  },
                ),
              ),
            ),
            // SizedBox
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.0,
              ),
            ),
            // Delete Button
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      print("delete");
                    },
                    label: Text(
                      "Delete Task",
                      style: theme.textTheme.titleLarge
                          ?.copyWith(color: Colors.red),
                    ),
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
            // Start Date
          ],
        ),
      ),
    );
  }
}
