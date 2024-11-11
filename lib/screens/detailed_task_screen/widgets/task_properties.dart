import 'package:flutter/material.dart';

import 'widgets.dart';

class TaskProperties extends StatelessWidget {
  const TaskProperties({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
    this.selectedCategory,
  });

  final IconData icon;
  final String text;
  final Map<String, dynamic>? selectedCategory;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final displayText = selectedCategory?['label'] ?? "Categories";
    final displayIcon = selectedCategory?["icon"];
    final displayColor = selectedCategory?["color"] ?? Colors.grey[800];
    final displayIconColor = selectedCategory?["iconColor"];
    final displayTextColor = selectedCategory?["iconColor"] ?? Colors.white;
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
          onTap: onPressed,
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
