import 'package:flutter/material.dart';

class ChatMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            MessageWidget(
              message: 'Hello there!',
              sender: 'John',
              date: 'July 6, 2023',
              isMe: true,
            ),
            MessageWidget(
              message:
                  'Hi John! How are you? Hi John! How are you? Hi John! How are you? Hi John! How are you?',
              sender: 'Alice',
              date: 'July 6, 2023',
              isMe: false,
            ),
          ],
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String message;
  final String sender;
  final String date;
  final bool isMe;

  MessageWidget({
    required this.message,
    required this.sender,
    required this.date,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
            constraints: BoxConstraints(
                maxWidth:
                    250), // Set the maximum width for the message container
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            sender,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            date,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
