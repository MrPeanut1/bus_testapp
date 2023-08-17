import 'package:bus_testapp/screens/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthScreen(),
    );
  }
}