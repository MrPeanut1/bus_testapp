import 'package:bus_testapp/screens/authenticate/auth_screen.dart';
import 'package:bus_testapp/screens/home/home_screen.dart';
import 'package:bus_testapp/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //return home or authenticate widget
    return const HomeScreen();
  }
}
