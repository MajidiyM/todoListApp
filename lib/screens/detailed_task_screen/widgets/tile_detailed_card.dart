import 'package:flutter/material.dart';

class TileDetailedCard extends StatelessWidget {
  const TileDetailedCard({
    super.key,
    this.icon,
    required this.title,
    required this.buttonTitle,
    this.onTap,
    this.buttonIcon,
    this.buttonColor,
    this.buttonIconColor,
  });

  final IconData? icon;
  final String title;
  final String buttonTitle;
  final IconData? buttonIcon;
  final Color? buttonColor;
  final VoidCallback? onTap;
  final Color? buttonIconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(icon, size: 25),
              const SizedBox(width: 6),
              Text(title, style: theme.textTheme.titleLarge),
            ],
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Material(
            clipBehavior: Clip.hardEdge,
            color: buttonColor ?? Colors.grey[800],
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  if (buttonIcon != null)
                    Icon(buttonIcon, color: buttonIconColor),
                  SizedBox(width: buttonIcon != null ? 8 : 0),
                  Text(
                    buttonTitle,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: buttonIconColor),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
