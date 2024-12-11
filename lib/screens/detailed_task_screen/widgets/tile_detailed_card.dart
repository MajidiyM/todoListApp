import 'package:flutter/material.dart';

class TileDetailedCard extends StatelessWidget {
  const TileDetailedCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.additionalTitle,
      this.onTap});

  final IconData icon;
  final String title;
  final String additionalTitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                icon,
                size: 25,
              ),
              const SizedBox(width: 6),
              Text(title, style: theme.textTheme.titleLarge),
            ],
          ),
        ),
        Material(
          clipBehavior: Clip.hardEdge,
          color: Colors.grey[800],
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 11),
              child: Text(additionalTitle, style: theme.textTheme.bodyLarge),
            ),
          ),
        ),
      ],
    );
  }
}
