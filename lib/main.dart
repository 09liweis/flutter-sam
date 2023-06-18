import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/todo_list_page.dart';
import './screens/tabbar_page.dart';
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
        home: TabbarScreen(),
      ),
    );
  }
}
