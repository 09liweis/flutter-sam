import 'package:flutter/material.dart';
import 'package:fluttersam/screens/chat_screen.dart';
import 'package:fluttersam/screens/expense_list_page.dart';
import 'package:fluttersam/screens/movie_list_screen.dart';
import 'package:fluttersam/screens/todo_list_page.dart';
import 'package:fluttersam/widgets/card.dart';

class DashboardCard {
  final String title;
  Color bgColor;
  final StatelessWidget screen;
  IconData icon;

  DashboardCard(
      {required this.title,
      this.bgColor = Colors.blue,
      required this.screen,
      this.icon = Icons.today});
}

List<DashboardCard> cards = [
  DashboardCard(
      screen: TodoScreen(), title: 'Todos', bgColor: const Color(0xfff96257)),
  DashboardCard(screen: MovieScreen(), title: 'Movies'),
  DashboardCard(screen: ExpenseScreen(), title: 'Expenses'),
  DashboardCard(screen: ChatMessageScreen(), title: 'Chat'),
  DashboardCard(screen: TodoScreen(), title: 'Places'),
  DashboardCard(screen: TodoScreen(), title: 'Comments'),
  DashboardCard(screen: TodoScreen(), title: 'Test'),
];

class DashboardCardList extends StatelessWidget {
  final List<DashboardCard> cards;

  const DashboardCardList({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final columnsCount = deviceWidth > 600 ? 3 : 2;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnsCount,
      ),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        return CardBlock(card: cards[index]);
      },
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Dashboard'),
        // ),
        body: DashboardCardList(cards: cards));
  }
}
