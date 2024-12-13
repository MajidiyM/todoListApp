import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/router/router.dart';
import 'package:todo_list_app/screens/detailed_task_screen/dialogs/show_date_range_picker.dart';
import 'package:todo_list_app/screens/detailed_task_screen/widgets/tile_detailed_card.dart';

import '../dialogs/show_category_dialog.dart';
import '../widgets/widgets.dart';

@RoutePage()
class DetailedTaskScreen extends StatefulWidget {
  const DetailedTaskScreen({super.key});

  @override
  _DetailedTaskScreenState createState() => _DetailedTaskScreenState();
}

class _DetailedTaskScreenState extends State<DetailedTaskScreen> {
  DateTime? _startDate;
  DateTime? _endDate;

  Map<String, dynamic>? selectedPriority;

  final List<Map<String, dynamic>> priorities = List.generate(
      10,
      (index) => {
            "icon": Icons.flag,
            "iconColor": Colors.blueAccent,
            "label": (index + 1).toString(),
            "color": Colors.grey[800],
          });

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
                      child: TaskContent(),
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
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 10),
            //     child: TaskProperties(
            //       title: "Task Categories",
            //       items: categories,
            //       icon: Icons.category_outlined,
            //       text: "Task Category",
            //       selectedItem: selectedCategory,
            //       onSelected: (selected) {
            //         setState(() {
            //           selectedCategory = selected;
            //         });
            //       },
            //       onTap: () => _showSelectionDialog,
            //     ),
            //   ),
            // ),
            // SizedBox

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TileDetailedCard(
                  icon: Icons.category_outlined,
                  title: "Task Categories",
                  additionalTitle: "Task Category",
                  onTap: () => showCategoryDialog(context),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.0,
              ),
            ),
            // Task Priority
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 10),
            //     child: TaskProperties(
            //       title: "Task Properties",
            //       icon: Icons.flag_outlined,
            //       text: "Task Priority",
            //       items: priorities,
            //       selectedItem: selectedPriority,
            //       onSelected: (selected) {
            //         setState(() {
            //           selectedPriority = selected;
            //         });
            //       },
            //       onTap: () => _showSelectionDialog,
            //     ),
            //   ),
            // ),
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
