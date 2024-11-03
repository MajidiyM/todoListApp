import 'package:flutter/material.dart';

class TaskPropertyButton extends StatelessWidget {
  const TaskPropertyButton({
    super.key,
    required this.buttonText,
    this.icon,
    this.color,
    this.iconColor,
    this.textColor,
  });

  final String buttonText;
  final IconData? icon;
  final Color? color;
  final Color? iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: color ?? Colors.grey[800],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              color: iconColor,
            ),
          SizedBox(
            width: icon != null ? 8 : 0,
          ),
          Text(
            buttonText,
            style: theme.textTheme.bodyLarge?.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
