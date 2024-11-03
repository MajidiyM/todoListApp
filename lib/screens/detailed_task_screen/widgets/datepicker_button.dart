import 'package:flutter/material.dart';

class DatePickerButton extends StatefulWidget {
  final String displayText;
  final VoidCallback onPressed;

  const DatePickerButton({
    Key? key,
    required this.displayText,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey[800],
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Text(
        widget.displayText,
        style: theme.textTheme.bodyLarge,
      ),
    );
  }
}
