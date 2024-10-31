import 'package:flutter/material.dart';

class TaskContent extends StatefulWidget {
  TaskContent({super.key});

  @override
  State<TaskContent> createState() => _TaskContentState();
}

class _TaskContentState extends State<TaskContent> {
  bool isTaskEditing = false;

  final TextEditingController _taskController =
      TextEditingController(text: "Do math homework");

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          isTaskEditing = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _taskController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          isTaskEditing = true;
        });
        _focusNode.requestFocus();
      },
      child: isTaskEditing
          ? TextField(
              decoration: InputDecoration(
                hintText: "Write task",
                border: InputBorder.none,
              ),
              focusNode: _focusNode,
              style: theme.textTheme.titleLarge,
              controller: _taskController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onSubmitted: (_) {
                setState(() {
                  isTaskEditing = false;
                });
              },
            )
          : Container(
              width: double.infinity,
              child: Text(
                _taskController.text,
                style: theme.textTheme.titleLarge,
              ),
            ),
    );
  }
}
