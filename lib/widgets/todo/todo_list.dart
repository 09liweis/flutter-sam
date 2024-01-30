import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttersam/models/todo.dart';
import 'package:fluttersam/providers/app_provider.dart';
import 'package:provider/provider.dart';
import '../../screens/todos/add_todo_page.dart';

class TodoItem extends StatelessWidget {
  final Todo task;
  const TodoItem({super.key, required this.task});
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<MainProvider>(context);
    var todoTitle = Text(
      task.getName(),
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color(0x73130303),
          decoration: (task.isDone())
              ? TextDecoration.lineThrough
              : TextDecoration.none),
    );
    return Card(
        child: ListTile(
      onLongPress: () async =>
          {await Clipboard.setData(ClipboardData(text: task.getName()))},
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddTodoScreen(
                      todo: task,
                    )))
      },
      leading: const Icon(Icons.list),
      title: todoTitle,
      subtitle: Text(
        task.getDate(),
        style: const TextStyle(color: Colors.amber, fontSize: 15),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
          size: 30,
        ),
        onPressed: () {
          todoProvider.removeTaskAtIndex(task);
        },
      ),
    ));
  }
}

class TodoList extends StatelessWidget {
  final List<Todo> tasks;

  const TodoList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TodoItem(task: tasks[index]);
      },
    );
  }
}
