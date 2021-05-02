import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_dev/screens/conversations_screen.dart';
import 'package:social_dev/screens/edit_profile.dart';
import 'package:social_dev/screens/find_devs.dart';
import 'package:social_dev/screens/home_screen.dart';
import 'package:social_dev/screens/login_screen.dart';
import 'package:social_dev/screens/profile_screen.dart';
import 'package:social_dev/screens/register_screen.dart';
import 'package:social_dev/screens/view_profile.dart';
import 'package:social_dev/screens/chat_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.redAccent,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white70),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/profile': (context) => ProfileScreen(),
        '/edit_profile': (context) => EditProfile(),
        '/find_devs': (context) => FindDevs(),
        '/view_profile': (context) => ViewProfile(),
        '/conversations_screen': (context) => ConversationsScreen(),
        '/chat_screen': (context) => ConversationsScreen(),
      },
    );
  }
}
