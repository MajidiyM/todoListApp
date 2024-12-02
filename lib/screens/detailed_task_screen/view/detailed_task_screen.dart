import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo_list_app/router/router.dart';

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

  Map<String, dynamic>? selectedCategory;
  Map<String, dynamic>? selectedPriority;

  final List<Map<String, dynamic>> categories = [
    {
      "icon": Icons.local_grocery_store_outlined,
      "iconColor": Color(0xFF21A300),
      "label": "Grocery",
      "color": Color(0xFFCCFF80),
    },
    {
      "icon": Icons.work_outline_outlined,
      "iconColor": Color(0xFFA31D00),
      "label": "Work",
      "color": Color(0xFFFF9680),
    },
    {
      "icon": Icons.sports_outlined,
      "iconColor": Color(0xFF00A32F),
      "label": "Sport",
      "color": Color(0xFF80FFFF),
    },
    {
      "icon": Icons.design_services_outlined,
      "iconColor": Color(0xFF00A372),
      "label": "Design",
      "color": Color(0xFF80FFD9),
    },
    {
      "icon": Icons.school_outlined,
      "iconColor": Color(0xFF0055A3),
      "label": "University",
      "color": Color(0xFF809CFF),
    },
    {
      "icon": Icons.people_outline,
      "iconColor": Color(0xFFA30089),
      "label": "Social",
      "color": Color(0xFFFF80EB),
    },
    {
      "icon": Icons.music_note_outlined,
      "iconColor": Color(0xFFA000A3),
      "label": "Music",
      "color": Color(0xFFFC80FF),
    },
    {
      "icon": Icons.health_and_safety_outlined,
      "iconColor": Color(0xFF00A3A3),
      "label": "Health",
      "color": Color(0xFF80FFA3),
    },
    {
      "icon": Icons.video_camera_back_outlined,
      "iconColor": Color(0xFF0069A3),
      "label": "Movie",
      "color": Color(0xFF80D1FF),
    },
    {
      "icon": Icons.home_outlined,
      "iconColor": Color(0xFFA30000),
      "label": "Home",
      "color": Color(0xFFFF8080),
    },
    {
      "icon": Icons.add,
      "iconColor": Color(0xFF00A369),
      "label": "Create New",
      "color": Color(0xFF80FFD1),
    },
  ];

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
                      displayText: _formatDate(_startDate),
                      onPressed: () => _showDateRangePicker(context),
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
            // End Date
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
                      displayText: _formatDate(_endDate),
                      onPressed: () => _showDateRangePicker(context),
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
                child: TaskProperties(
                  title: "Task Categories",
                  items: categories,
                  icon: Icons.category_outlined,
                  text: "Task Category",
                  selectedItem: selectedCategory,
                  onSelected: (selected) {
                    setState(() {
                      selectedCategory = selected;
                    });
                  },
                  onTap: () => _showSelectionDialog,
                ),
              ),
            ),
            // SizedBox
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.0,
              ),
            ),
            // // Task Priority
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TaskProperties(
                  title: "Task Properties",
                  icon: Icons.flag_outlined,
                  text: "Task Priority",
                  items: priorities,
                  selectedItem: selectedPriority,
                  onSelected: (selected) {
                    setState(() {
                      selectedPriority = selected;
                    });
                  },
                  onTap: () => _showSelectionDialog,
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

  Future<void> _showDateRangePicker(BuildContext context) async {
    final theme = Theme.of(context);
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF2f2d38),
        title: Text("Select Start and End Dates"),
        content: SizedBox(
          height: 300,
          width: 350,
          child: SfDateRangePicker(
            selectionMode: DateRangePickerSelectionMode.range,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                setState(() {
                  _startDate = args.value.startDate;
                  _endDate = args.value.endDate;
                });
              }
            },
            showActionButtons: true,
            onSubmit: (Object? val) {
              Navigator.pop(context);
            },
            onCancel: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    return date != null ? DateFormat('dd/MM/yyyy').format(date) : "Select date";
  }

  void _showSelectionDialog(
      BuildContext context,
      List<Map<String, dynamic>> items,
      String title,
      Function(Map<String, dynamic>) onSelected) {
    showDialog(
      context: context,
      builder: (context) => TaskPropertiesDialog(
        items: items,
        title: title,
      ),
    ).then((selectedLabel) {
      if (selectedLabel != null) {
        print("Selected item: $selectedLabel"); // For debugging
        final selectedItem = items.firstWhere(
          (item) => item["label"] == selectedLabel,
          orElse: () => items[0], // Default item if none found
        );
        onSelected(
            selectedItem); // Use the callback to update the selected item
      }
    });
  }
}
