import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              color: Colors.blue, // Define border color when focused
            ),
          ),
          hintText: "Search for your task...",
          hintStyle: TextStyle(color: theme.hintColor, fontSize: 16),
          prefixIcon: Icon(
            Icons.search,
            color: theme.hintColor,
          ),
          filled: true,
          fillColor: Color(0xFF1D1D1D),
        ),
      ),
    );
  }
}
