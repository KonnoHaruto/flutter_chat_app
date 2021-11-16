import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../reference.dart';
import '../constants.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  late User? logedInUser;
  late String messageText;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() {
    final User? user = _auth.currentUser;
    try {
      if (user != null) {
        logedInUser = user;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void messageStream() async {
    await for (var snapshot in chatRef.snapshots()) {
      for (var message in snapshot.docs) {
        // ignore: avoid_print
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
        title: const Text('chat_app'),
        backgroundColor: Colors.greenAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: messageDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder<QuerySnapshot>(
                    stream: chatRef.snapshots(),
                    builder: (context, snapshot) {
                      List<Text> messageWidgets = [];
                      if (snapshot.hasData) {
                        final messages = snapshot.data!.docs;

                        for (var message in messages) {
                          final messageText = message.get('text');
                          final messageSender = message.get('sender');
                          final messageWidget =
                              Text('$messageSender said $messageText');
                          messageWidgets.add(messageWidget);
                        }
                      }
                      return Column(
                        children: messageWidgets,
                      );
                    },
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: textFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      chatRef.add({
                        'text': messageText,
                        'sender': logedInUser!.email,
                      });
                      messageStream();
                    },
                    child: const Text(
                      '送信',
                      style: sendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
