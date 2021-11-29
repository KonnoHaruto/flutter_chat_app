import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/view/chat_screen.dart';

import 'message_datum.dart';
import 'reference.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: chatRef.orderBy('createdAt', descending: false).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        List<MessageDatum> messageData = [];
        for (var message in messages) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');
          final currentUser = loggedInUser!.email;

          final messageDatum = MessageDatum(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );
          messageData.add(messageDatum);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageData,
          ),
        );
      },
    );
  }
}
