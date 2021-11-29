import 'package:flutter/material.dart';

class MessageDatum extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MessageDatum({
    Key? key,
    required this.sender,
    required this.text,
    required this.isMe
    });

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black38,
            ),
          ),
          Material(
            borderRadius: isMe
            ? const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))
            : const BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)
            ),
            elevation: 5,
            color: isMe ? Colors.lightGreenAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black38,
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
