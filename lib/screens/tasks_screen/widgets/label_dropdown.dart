import 'package:flutter/material.dart';

class LabelDropdown extends StatelessWidget {
  const LabelDropdown({
    super.key,
    required this.labelName,
  });

  final String labelName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Text(
            labelName,
            style: theme.textTheme.titleMedium,
          ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
