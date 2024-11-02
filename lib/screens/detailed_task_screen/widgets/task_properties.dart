import 'package:flutter/material.dart';

import 'widgets.dart';

class TaskProperties extends StatelessWidget {
  const TaskProperties({
    super.key,
    required this.icon,
    required this.text,
    required this.buttonText,
    this.onPressed,
  });

  final IconData icon;
  final String text;
  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
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
            buttonText: buttonText,
          ),
        ),
      ],
    );
  }
}
