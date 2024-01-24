import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/todo.dart';
import '../../providers/app_provider.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key, todo});
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String todoDate = '';

  String _getFormattedValue(int value) {
    return value.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<MainProvider>(context);

    DateTime now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                labelText: 'New Todo',
              ),
            ),
            CalendarDatePicker(
              initialDate: now,
              firstDate: now,
              lastDate: DateTime(2100),
              onDateChanged: (value) {
                setState(() {
                  todoDate =
                      "${value.year}-${_getFormattedValue(value.month)}-${_getFormattedValue(value.day)}";
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final newTodo = Todo(
                    id: (todoProvider.tasks.length + 1).toString(),
                    name: _textEditingController.text,
                    status: 'pending',
                    date: todoDate);
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
