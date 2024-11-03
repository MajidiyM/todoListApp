import 'package:flutter/material.dart';

import 'widgets.dart';

class TaskProperties extends StatelessWidget {
  const TaskProperties({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
    required this.selectedCategory,
  });

  final IconData icon;
  final String text;
  final Map<String, dynamic> selectedCategory;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final iconColor = selectedCategory["iconColor"];
    final textColor = selectedCategory["iconColor"];
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
            buttonText: selectedCategory["label"],
            icon: selectedCategory["icon"],
            color: selectedCategory["color"],
            iconColor: selectedCategory["iconColor"],
            textColor: selectedCategory["iconColor"],
          ),
        ),
      ],
    );
  }
}
