import 'package:flutter/material.dart';

class CardBlock extends StatelessWidget {
  final String title;

  const CardBlock({
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0c62a9),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}