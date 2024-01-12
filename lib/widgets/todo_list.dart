import 'package:flutter/material.dart';
import 'package:fluttersam/models/todo.dart';
import '../screens/add_todo_page.dart';

class TodoItem extends StatelessWidget {
  final Todo task;
  const TodoItem({super.key, required this.task});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddTodoScreen()))
      },
      leading: const Icon(Icons.list),
      title: Text(
        task.getName(),
        style: TextStyle(
            decoration: (task.isDone())
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      subtitle: Text(
        task.getDate(),
        style: const TextStyle(color: Colors.cyan, fontSize: 15),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
          size: 30,
        ),
        onPressed: () {},
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  final List<Todo> tasks;
  final Function(int) onPressed;

  const TodoList({super.key, required this.tasks, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TodoItem(task: task);
      },
    );
  }
}
