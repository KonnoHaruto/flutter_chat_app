import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/view/chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 200.0,
              child: Icon(
                Icons.message,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
                email = value;
              },
              decoration: const InputDecoration(
                hintText: 'メールアドレスを入力',
                hintStyle: TextStyle(color: Colors.black),
                contentPadding:
                    EdgeInsets.symmetric(
                      vertical: 10.0, 
                      horizontal: 20.0,
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                    ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent, 
                    width: 1.0,
                    ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                    ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent, 
                    width: 2.0,
                    ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                    ),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              style: const TextStyle(color: Colors.black),
              onChanged: (value) {
                //Do something with the user input.
                password = value;
              },
              decoration: const InputDecoration(
                hintText: 'パスワードを入力',
                hintStyle: TextStyle(color: Colors.black),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0, 
                  horizontal: 20.0,
                  ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                    ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent, 
                    width: 1.0,
                    ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                    ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent, 
                    width: 2.0,
                    ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                    ),
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      // ignore: unnecessary_null_comparison
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    } catch (e) {
                      //ignore: avoid_print
                      print(e);
                    }
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    '登録',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
