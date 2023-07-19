import 'package:flutter/material.dart';

class CardBlock extends StatelessWidget {
  final String title;
  final Color bgColor;

  const CardBlock({required this.title, required this.bgColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
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
