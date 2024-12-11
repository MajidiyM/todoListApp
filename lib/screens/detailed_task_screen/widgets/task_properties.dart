import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/detailed_task_screen/widgets/task_poperties_button.dart';
import 'package:todo_list_app/screens/detailed_task_screen/widgets/task_properties_dialog.dart';

class TaskProperties extends StatelessWidget {
  const TaskProperties({
    super.key,
    required this.icon,
    required this.text,
    required this.items,
    required this.title,
    this.onSelected,
    this.selectedItem,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final List<Map<String, dynamic>> items;
  final String title;
  final Function(Map<String, dynamic>)? onSelected;
  final Map<String, dynamic>? selectedItem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final defaultText = text == "Task Category" ? "Categories" : "Priority";
    final displayText = selectedItem?['label'] ?? defaultText;
    final displayIcon = selectedItem?["icon"];
    final displayColor = selectedItem?["color"] ?? Colors.grey[800];
    final displayIconColor = selectedItem?["iconColor"];
    final displayTextColor = selectedItem?["iconColor"] ?? Colors.white;
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 25),
        SizedBox(width: 10),
        Text(
          text,
          style: theme.textTheme.titleLarge,
        ),
        Spacer(),
        GestureDetector(
          onTap: () async {
            final selected = await showDialog<Map<String, dynamic>>(
              context: context,
              builder: (context) => TaskPropertiesDialog(
                items: items,
                title: title,
              ),
            );
            if (selected != null && onSelected != null) {
              onSelected!(selected);
            }
          },
          child: TaskPropertyButton(
            buttonText: displayText,
            icon: displayIcon,
            color: displayColor,
            iconColor: displayIconColor,
            textColor: displayTextColor,
          ),
        ),
      ],
    );
  }
}
