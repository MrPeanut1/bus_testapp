import 'package:bus_testapp/screens/authenticate/auth_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Screen'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/welcome_bg.jpg'), // Background image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AuthScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Adjust padding
            ).copyWith(
              backgroundColor: MaterialStateProperty.all(Colors.green), // Set the button color to green
            ),
            child: const Text(
              'Welcome ->',
              style: TextStyle(
                fontWeight: FontWeight.bold, // Make the text bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}
