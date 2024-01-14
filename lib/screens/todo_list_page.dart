import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './add_todo_page.dart';
import '../widgets/todo_list.dart';
import '../providers/todo_provider.dart';

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
        Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        )
      ],
    );

    const loadingWidget = Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(elevation: 0, title: titleBar),
      body: Column(
        children: [
          Expanded(
              child: todoProvider.loading
                  ? loadingWidget
                  : TodoList(
                      tasks: todoProvider.tasks,
                      onPressed: todoProvider.removeTaskAtIndex,
                    )),
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
              context, MaterialPageRoute(builder: (context) => AddTodoScreen()))
        },
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}
