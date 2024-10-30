import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailedTaskScreen extends StatelessWidget {
  const DetailedTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Radio(value: null, groupValue: null, onChanged: null),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: theme.primaryColor,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: TaskContent(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
