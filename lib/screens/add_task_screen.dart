import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;

  const AddTaskScreen({required this.addTaskCallback});
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.lightBlueAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle);
                Navigator.pop(context);
              },
              child: Text('ADD'),
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(8.0),
                backgroundColor: Colors.lightBlueAccent,
                primary: Colors.white,
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
