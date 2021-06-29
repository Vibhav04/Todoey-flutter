import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Dismissible(
              key: Key(Provider.of<TaskData>(context).tasks[index].name),
              background: Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.red,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "DELETE",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                taskData.deleteTask(task);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Item deleted"),
                  ),
                );
              },
              child: TaskTile(
                isChecked: task.isDone,
                taskTitle: task.name,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
