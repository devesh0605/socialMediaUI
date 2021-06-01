import 'package:flutter/material.dart';
import 'package:social_media_ui/screens/login_screen.dart';
import 'package:social_media_ui/screens/random_user.dart';
import 'package:social_media_ui/screens/spotify_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Social UI',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
