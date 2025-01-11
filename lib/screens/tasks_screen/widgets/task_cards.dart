import 'package:flutter/material.dart';

import '../tasks_screen.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    this.title,
    this.startDate,
    this.endDate,
    this.category,
    this.priority,
    this.color,
    this.iconColor,
    this.icon,
  });

  final String? title;
  final String? startDate;
  final String? endDate;
  final String? category;
  final String? priority;
  final Color? color;
  final Color? iconColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 15),
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Radio(
            value: null,
            groupValue: null,
            onChanged: null,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null && title!.isNotEmpty)
                  Text(
                    title!,
                    style: theme.textTheme.titleLarge,
                  ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (startDate != null && endDate != null)
                        TaskDates(startDate: startDate, endDate: endDate),
                      if (category != null && category!.isNotEmpty)
                        CategoryTask(
                          category: category,
                          iconColor: iconColor,
                          color: color,
                          icon: icon,
                        ),
                      if (priority != null && priority!.isNotEmpty)
                        PriorityTask(priority: priority)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
