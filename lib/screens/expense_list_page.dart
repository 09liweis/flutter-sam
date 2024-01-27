import 'package:flutter/material.dart';
import 'package:fluttersam/models/expense_statistics.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class ExpenseScreen extends StatelessWidget {
  Future<void> onRefresh() async {}

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    mainProvider.fetchStatistic();
    ExpenseStatistics es = mainProvider.es;
    List<CategoryExpenses> ce = es.getCategoryPrice();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
        ),
        body: RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(
                itemCount: ce.length,
                itemBuilder: (context, idx) {
                  return ExpenseItem(
                      category: ce[idx].category, amount: ce[idx].total);
                })));
  }
}

class ExpenseItem extends StatelessWidget {
  final String category;
  final String amount;

  const ExpenseItem({
    required this.category,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {print(category)},
      // leading: const CircleAvatar(
      //   child: Icon(Icons.food_bank),
      // ),
      title: Text(category),
      subtitle: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, nestedIndex) {
          return ListTile(
            title: Text('Nested Item $nestedIndex'),
            leading: Icon(Icons.foggy),
            trailing: Text('345'),
          );
        },
      ),
      trailing: Text(
        amount,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
