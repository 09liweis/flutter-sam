import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/add_todo_page.dart';
import './providers/todo_provider.dart';
import './widgets/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: TodoScreen(),
      ),
    );
  }
}

class TodoScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Column(
        children: [
          Expanded(
              child: TodoList(
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
