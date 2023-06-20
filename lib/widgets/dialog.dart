import 'package:flutter/material.dart';

class ComfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function()? onConfirm;

  const ComfirmDialog({
    required this.title,
    required this.message,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // TextButton(
        //   child: Text('Confirm'),
        //   onPressed: onConfirm ?? () {},
        // ),
      ],
    );
  }
}
