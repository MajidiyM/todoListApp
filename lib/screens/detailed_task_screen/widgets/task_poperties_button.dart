import 'package:flutter/material.dart';

class TaskPropertyButton extends StatelessWidget {
  const TaskPropertyButton({
    super.key,
    required this.buttonText,
  });

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        buttonText,
        style: theme.textTheme.bodyLarge,
      ),
    );
  }
}
