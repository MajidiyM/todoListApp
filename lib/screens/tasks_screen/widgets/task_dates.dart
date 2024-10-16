import 'package:flutter/material.dart';

class TaskDates extends StatelessWidget {
  const TaskDates({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  final String? startDate;
  final String? endDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          startDate ?? "",
          style: theme.textTheme.bodyMedium,
        ),
        Container(
          width: 2,
          height: 15,
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 4),
        ),
        Text(
          endDate ?? "",
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
