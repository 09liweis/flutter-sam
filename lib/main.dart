import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

import './services/todo_service.dart';
import './models/todo.dart';

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

class TodoProvider extends ChangeNotifier {
  List<Task> tasks = [];

  Future<void> fetchTasks() async {
    try {
      tasks = await TodoService.fetchTasks();
      notifyListeners();
    } catch (error) {
      throw Exception('Failed to fetch tasks: $error');
    }
  }

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void removeTaskAtIndex(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}

class TodoScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    todoProvider.fetchTasks();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = todoProvider.tasks[index];
                return ListTile(
                  title: Text(task.name),
                  subtitle: Text('Status: ${task.status.toString()}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      todoProvider.removeTaskAtIndex(index);
                    },
                  ),
                );
              },
            ),
          ),
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
    );
  }
}
