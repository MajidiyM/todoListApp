import 'package:flutter/material.dart';

class CategoryTask extends StatelessWidget {
  const CategoryTask({
    super.key,
    required this.category,
  });

  final String? category;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
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
    );
  }
}
