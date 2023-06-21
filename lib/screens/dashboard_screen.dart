import 'package:flutter/material.dart';
import 'package:fluttersam/screens/todo_list_page.dart';
import 'package:fluttersam/widgets/card.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dashboard'),
      // ),
      body: GridView.count(
        crossAxisCount: 2,
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
              child: const CardBlock(title: 'Blogs'),
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
        ],
      ),
    );
  }
}
