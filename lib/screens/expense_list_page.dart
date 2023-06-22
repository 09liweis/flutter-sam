import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class ExpenseScreen extends StatelessWidget {
  Future<void> onRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
        ),
        body: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView(
            children: <Widget>[
              const ExpenseItem(
                category: 'Food',
                amount: '50.00',
                date: 'June 20, 2023',
              ),
              const ExpenseItem(
                category: 'Transportation',
                amount: '25.00',
                date: 'June 19, 2023',
              ),
              const ExpenseItem(
                category: 'Entertainment',
                amount: '10.00',
                date: 'June 18, 2023',
              ),
              // Add more expense items as needed
            ],
          ),
        ));
  }
}

class ExpenseItem extends StatelessWidget {
  final String category;
  final String amount;
  final String date;

  const ExpenseItem({
    required this.category,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {print(category)},
      leading: const CircleAvatar(
        child: Icon(Icons.food_bank),
      ),
      title: Text(category),
      subtitle: Text(date),
      trailing: Text(
        '\$$amount',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
