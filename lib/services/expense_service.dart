import 'dart:convert';
import 'package:fluttersam/models/expense_statistics.dart';
import 'package:fluttersam/services/api_service.dart';

class ExpenseService extends ApiService {
  static Future<ExpenseStatistics> fetchStatistic() async {
    final response = await ApiService.post('transactions/statistics', {});
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ExpenseStatistics.fromMap(jsonData);
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }
}
