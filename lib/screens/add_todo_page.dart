import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';
import '../providers/todo_provider.dart';

class AddTodoScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  String _getFormattedValue(int value) {
    return value.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<MainProvider>(context);

    DateTime now = DateTime.now();
    String formattedDate =
        "${now.year}-${_getFormattedValue(now.month)}-${_getFormattedValue(now.day)}";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                labelText: 'New Todo',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final newTodo = Todo(
                    id: (todoProvider.tasks.length + 1).toString(),
                    name: _textEditingController.text,
                    status: 'pending',
                    date: formattedDate);
                todoProvider.addTask(newTodo);
                Navigator.pop(context);
              },
              child: const Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
