import 'package:flutter/material.dart';
import 'package:fluttersam/screens/chat_screen.dart';
import 'package:fluttersam/screens/expense_list_page.dart';
import 'package:fluttersam/screens/movies/movie_list_screen.dart';
import 'package:fluttersam/screens/todos/todo_list_page.dart';
import 'package:fluttersam/services/api_service.dart';
import 'package:provider/provider.dart';

import './screens/tabbar_page.dart';
import './providers/app_provider.dart';

void main() {
  ApiService.getAPIRoutes();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => MainProvider())],
    child: const SamApp(),
  ));
}

class SamApp extends StatelessWidget {
  const SamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TabbarScreen(),
      routes: {
        '/todos': (context) => TodoScreen(),
        '/movies': (context) => MovieScreen(),
        '/expenses': (context) => ExpenseScreen(),
        '/chat': (context) => ChatMessageScreen()
      },
    );
  }
}
