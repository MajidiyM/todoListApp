import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.title,
    this.startDate,
    this.endDate,
    this.category,
    this.priority,
  });

  final String title;
  final String? startDate;
  final String? endDate;
  final String? category;
  final String? priority;

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
                Text(
                  title,
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
                      Column(
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
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          backgroundColor: Color(0xFF809CFF),
                          iconColor: Color(0xFF0055A3),
                        ),
                        onPressed: () {},
                        label: Text(
                          category ?? "",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        icon: Icon(Icons.school_outlined),
                      ),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: BorderSide(
                            color: Color(0xFF8687E7),
                          ),
                          iconColor: Colors.white,
                        ),
                        onPressed: () {},
                        label: Text(
                          priority ?? "",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        icon: Icon(Icons.outlined_flag_rounded),
                      )
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
