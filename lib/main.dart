import 'package:flutter/material.dart';
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
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black54)
        ),
      ),
      initialRoute: 'longin_screen',
      routes: {
        const WelcomeScreen().id: (context) => const WelcomeScreen(),
        // 'login_screen': (context) => LoginScreen(),
        // 'registration_screen': (context) => RegistrationScreen(),
        // 'chat_screen': (context) => ChatScreen(),
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}