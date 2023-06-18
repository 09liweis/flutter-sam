import 'package:flutter/material.dart';

import 'todo_list_page.dart';

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
          TodoScreen(),
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
            text: 'Tab 1',
          ),
          Tab(
            icon: Icon(
              Icons.search,
              color: Colors.amber,
            ),
            text: 'Tab 2',
          ),
          Tab(
            icon: Icon(
              Icons.person,
              color: Colors.amber,
            ),
            text: 'Tab 3',
          ),
        ],
      ),
    );
  }
}
