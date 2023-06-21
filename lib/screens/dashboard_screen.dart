import 'package:flutter/material.dart';
import 'package:fluttersam/screens/todo_list_page.dart';
import 'package:fluttersam/widgets/card.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final columnsCount = deviceWidth > 600 ? 3 : 2;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dashboard'),
      // ),
      body: GridView.count(
        crossAxisCount: columnsCount,
        children: [
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TodoScreen()));
              },
              child: const CardBlock(title: 'Todos'),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                // Handle the onTap action for Blogs block
              },
              child: const CardBlock(title: 'Movies'),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                // Handle the onTap action for Comments block
              },
              child: const CardBlock(title: 'Expenses'),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                // Handle the onTap action for Comments block
              },
              child: const CardBlock(title: 'Blogs'),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                // Handle the onTap action for Comments block
              },
              child: const CardBlock(title: 'Places'),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                // Handle the onTap action for Comments block
              },
              child: const CardBlock(title: 'Comments'),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                // Handle the onTap action for Comments block
              },
              child: const CardBlock(title: 'Test'),
            ),
          ),
        ],
      ),
    );
  }
}
