import 'package:flutter/material.dart';

class PriorityTask extends StatelessWidget {
  const PriorityTask({
    super.key,
    required this.priority,
  });

  final String? priority;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
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
    );
  }
}
