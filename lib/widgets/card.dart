import 'package:flutter/material.dart';
import 'package:fluttersam/screens/dashboard_screen.dart';

class CardBlock extends StatelessWidget {
  final DashboardCard card;

  const CardBlock({required this.card});
  @override
  Widget build(BuildContext context) {
    const cardTextStyle = TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
    return Card(
      color: card.bgColor,
      child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => card.screen));
          },
          child: Container(
            child: Center(
              child: Text(
                card.title,
                style: cardTextStyle,
              ),
            ),
          )),
    );
  }
}
