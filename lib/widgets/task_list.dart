import 'package:flutter/material.dart';
import 'package:flutter_todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              dismissedCallback: (DismissDirection direction) {
                taskData.deleteTask(task);
                final snackBar = SnackBar(
                    content: Text('Task Deleted'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // add task back to list
                        Provider.of<TaskData>(context, listen: false)
                            .addTask(task.name);
                      },
                    ));
                Scaffold.of(context).showSnackBar(snackBar);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
