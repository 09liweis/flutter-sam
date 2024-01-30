import 'package:flutter/material.dart';
import 'package:fluttersam/screens/dashboard_screen.dart';

class CardBlock extends StatelessWidget {
  final DashboardCard card;

  const CardBlock({super.key, required this.card});
  @override
  Widget build(BuildContext context) {
    const cardTextStyle = TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
    var cardText = Text(card.title, style: cardTextStyle);
    var cardIcon = Icon(
      card.icon,
      color: Colors.white,
      size: 30,
    );
    return Card(
      color: card.bgColor,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, card.route);
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [cardIcon, const SizedBox(width: 10), cardText],
          ),
        ),
      ),
    );
  }
}
