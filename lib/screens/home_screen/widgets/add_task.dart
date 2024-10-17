import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/router/router.dart';

class AddTask extends StatelessWidget {
  const AddTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 64,
      width: 64,
      child: FloatingActionButton(
        backgroundColor: theme.floatingActionButtonTheme.backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          context.router.push(DetailedTaskRoute());
        },
      ),
    );
  }
}
