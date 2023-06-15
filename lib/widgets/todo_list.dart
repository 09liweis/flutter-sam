import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fluttersam/models/todo.dart';

class TodoList extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onPressed;

  TodoList({required this.tasks, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          leading: const Icon(Icons.list),
          title: Text(
            task.name,
            style: TextStyle(
                decoration: (task.status == 'done')
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          subtitle: Text(
            task.date,
            style: const TextStyle(color: Colors.cyan),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              onPressed(index);
            },
          ),
        );
      },
    );
  }
}
