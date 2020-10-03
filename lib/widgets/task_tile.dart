import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function dismissedCallback;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.dismissedCallback});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: Colors.lightBlueAccent,
      ),
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: dismissedCallback,
        child: CheckboxListTile(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          title: Text(
            taskTitle,
            style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null,
            ),
          ),
          controlAffinity: ListTileControlAffinity.platform,
          onChanged: checkboxCallback,
        ),
      ),
    );
  }
}
