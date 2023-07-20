import 'package:flutter/material.dart';
import 'package:fluttersam/screens/chat_screen.dart';
import 'package:fluttersam/screens/expense_list_page.dart';
import 'package:fluttersam/screens/movie_list_screen.dart';
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
              child: const CardBlock(
                title: 'Todos',
                bgColor: Color(0xfff96257),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MovieScreen()));
              },
              child:
                  const CardBlock(title: 'Movies', bgColor: Color(0xd9ae4848)),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExpenseScreen()));
              },
              child: const CardBlock(
                  title: 'Expenses', bgColor: Color(0xffac00ef)),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatMessageScreen()));
                // Handle the onTap action for Comments block
              },
              child: const CardBlock(title: 'Chat', bgColor: Color(0xff0085ff)),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                // Handle the onTap action for Comments block
              },
              child: const CardBlock(title: 'Places', bgColor: Colors.blue),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                // Handle the onTap action for Comments block
              },
              child: const CardBlock(title: 'Comments', bgColor: Colors.blue),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                // Handle the onTap action for Comments block
              },
              child: const CardBlock(title: 'Test', bgColor: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
