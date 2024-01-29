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
                    categoryExpenses: ce[idx],
                  );
                })));
  }
}

class ExpenseItem extends StatelessWidget {
  final CategoryExpenses categoryExpenses;

  const ExpenseItem({
    required this.categoryExpenses,
  });

  @override
  Widget build(BuildContext context) {
    List<Expense> expenses = categoryExpenses.items;
    return ListTile(
      onTap: () => {print("")},
      // leading: const CircleAvatar(
      //   child: Icon(Icons.food_bank),
      // ),
      title: Text(categoryExpenses.category),
      subtitle: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: expenses.length,
        itemBuilder: (context, nestedIndex) {
          Expense expense = expenses[nestedIndex];
          Place? place = expense.place;
          return ListTile(
            title: Text(place?.getName() ?? ''),
            leading: Icon(Icons.foggy),
            trailing: Text(expenses[nestedIndex].price),
          );
        },
      ),
      trailing: Text(
        categoryExpenses.total,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
