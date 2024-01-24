import 'package:flutter/material.dart';
import 'package:fluttersam/widgets/card.dart';

class DashboardCard {
  final String title;
  Color bgColor;
  final String route;
  IconData icon;

  DashboardCard(
      {required this.title,
      this.bgColor = Colors.blue,
      required this.route,
      this.icon = Icons.list});
}

List<DashboardCard> cards = [
  DashboardCard(
      route: '/todos', title: 'Todos', bgColor: const Color(0xfff96257)),
  DashboardCard(route: '/movies', title: 'Movies', icon: Icons.movie),
  DashboardCard(route: '/expenses', title: 'Expenses', icon: Icons.paid),
  DashboardCard(route: '/chat', title: 'Chat'),
  DashboardCard(route: '/todos', title: 'Places'),
  DashboardCard(route: '/todos', title: 'Comments'),
  DashboardCard(route: '/todos', title: 'Test'),
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
