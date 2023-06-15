import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

import './models/todo.dart';
import './screens/add_todo_page.dart';
import './providers/todo_provider.dart';

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
            child: ListView.builder(
              itemCount: todoProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = todoProvider.tasks[index];
                return ListTile(
                  leading: const Icon(Icons.list),
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
