import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_dev/screens/home_screen.dart';
import 'package:social_dev/screens/login_screen.dart';
import 'package:social_dev/screens/profile_screen.dart';
import 'package:social_dev/screens/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.redAccent,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
