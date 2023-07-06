import 'dart:convert';
import 'package:fluttersam/services/api_service.dart';

import '../models/todo.dart';

class ExpenseService extends ApiService {
  static Future<List<Todo>> fetchStatistic() async {
    final response = await ApiService.post('transactions/statistics');
    print(response.body);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return List<Todo>.from(jsonData.map((task) => Todo.fromJson(task)));
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }
}
