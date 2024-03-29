import 'package:flutter/material.dart';
import 'package:fluttersam/models/todo.dart';
import 'package:provider/provider.dart';
import './add_todo_page.dart';
import '../../widgets/todo/todo_list.dart';
import '../../providers/app_provider.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<MainProvider>(context);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (todoProvider.tasks.isEmpty) {
        todoProvider.fetchTasks();
      }
    });

    const titleBar = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Todo List"),
        Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        )
      ],
    );

    const loadingWidget = Center(child: CircularProgressIndicator());

    const addTodoIcon = Icon(
      Icons.add,
      size: 32,
    );

    return Scaffold(
      appBar: AppBar(elevation: 0, title: titleBar),
      body: Column(
        children: [
          Expanded(
              child: todoProvider.loading
                  ? loadingWidget
                  : TodoList(tasks: todoProvider.tasks)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                todoProvider.fetchTasks();
              },
              child: const Text('Fetch Tasks'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        clipBehavior: Clip.hardEdge,
        elevation: 1.4,
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTodoScreen(todo: Todo())))
        },
        child: addTodoIcon,
      ),
    );
  }
}
