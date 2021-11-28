import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'reference.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: chatRef.orderBy('createdAt', descending: false).snapshots(),
      builder: (context, snapshot) {
        List<Text> messageWidgets = [];
        if (snapshot.hasData) {
          final messages = snapshot.data!.docs;
          for (var message in messages) {
            final messageText = message.get('text');
            final messageSender = message.get('sender');
            final messageWidget = Text('$messageSender said $messageText');
            messageWidgets.add(messageWidget);
          }
        }
        return Column(
          children: messageWidgets,
        );
      },
    );
  }
}
