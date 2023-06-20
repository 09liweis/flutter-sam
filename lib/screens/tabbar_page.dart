import 'package:flutter/material.dart';

import 'todo_list_page.dart';
import 'expense_list_page.dart';

class TabbarScreen extends StatefulWidget {
  @override
  _TabbarScreenState createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab Navigation'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Add your tab views here
          TodoScreen(),
          ExpenseListScreen(),
          TodoScreen()
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(
            icon: Icon(
              Icons.home,
              color: Colors.amber,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.money_outlined,
              color: Colors.red,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.person,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
