import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isSignIn = true; // For toggling between sign-in and registration

  void _signInWithEmailPassword() {
    // Implement sign-in logic here
  }

  void _registerWithEmailPassword() {
    // Implement registration logic here
  }

  void _showInvalidEmailPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Invalid Email'),
          content: const Text('Please enter a valid email address.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication Example'),
      ),
      body: Center(
        child: Container(
          width: 300, // Set the desired width
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adjust the size of the column
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 10),
              if (isSignIn) // Show this only during sign-in
                ElevatedButton(
                  onPressed: _signInWithEmailPassword,
                  child: const Text('Sign In with Email'),
                )
              else // Show this only during registration
                ElevatedButton(
                  onPressed: _registerWithEmailPassword,
                  child: const Text('Register with Email'),
                ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Toggle between sign-in and registration
                  setState(() {
                    isSignIn = !isSignIn;
                  });
                },
                child: Text(isSignIn ? 'Don\'t have an account? Register' : 'Already have an account? Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
