import 'package:flutter/material.dart';
import 'package:bus_testapp/screens/home/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // if (user != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
            // } else {
            //   // Handle case where user is null or not signed in
            // }
          },
          child: const Text('Welcome'),
        ),
      ),
    );
  }
}
