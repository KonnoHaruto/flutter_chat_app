import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screen/registration_screen.dart';
import 'package:flutter_chat_app/screen/welcome_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter_chat_app',
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
      },
    );
  }
}