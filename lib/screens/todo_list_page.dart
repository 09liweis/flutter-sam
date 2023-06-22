import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './add_todo_page.dart';
import '../widgets/todo_list.dart';
import '../providers/todo_provider.dart';

class TodoScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    if (todoProvider.tasks.isEmpty) {
      todoProvider.fetchTasks(); //TODO: EXCEPTION CAUGHT
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          Expanded(
              child: todoProvider.loading
                  ? const Center(child: CircularProgressIndicator())
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
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTodoScreen()))
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
