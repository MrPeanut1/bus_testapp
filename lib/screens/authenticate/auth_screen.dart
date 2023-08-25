import 'package:bus_testapp/screens/home/home_screen.dart';
import 'package:bus_testapp/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

// class _AuthScreenState extends State<AuthScreen> {
//   final AuthService _auth = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.blue[100],
//         appBar: AppBar(
//           backgroundColor: Colors.blue[400],
//           elevation: 0.0,
//           title: const Text('Sign in'),
//         ),
//         body: Container(
//             padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//             child: ElevatedButton(
//               child: const Text('Sign in anonymously'),
//               onPressed: () async {
//                 dynamic result = await _auth.signInAnon();
//                 if (result == null) {
//                   print('Error singing in');
//                 } else {
//                   print('signed in');
//                 }
//               },
//             )));
//   }
// }

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isSignIn = true; // For toggling between sign-in and registration

  Future<void> _signIn() async {
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        _navigateToWelcomeScreen();
      }
    } catch (e) {
      // Handle sign-in error
      print('Error signing in: $e');
    }
  }

  Future<void> _register() async {
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        _navigateToWelcomeScreen();
      }
    } catch (e) {
      // Handle registration error
      print('Error registering: $e');
    }
  }

  Future<void> _anonymousSignIn() async {
    try {
      await _auth.signInAnonymously();
      _navigateToWelcomeScreen();
    } catch (e) {
      // Handle anonymous sign-in error
      print('Error signing in anonymously: $e');
    }
  }

  void _navigateToWelcomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Login'),
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isSignIn ? _signIn : _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text(isSignIn ? 'Sign In' : 'Register'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  setState(() {
                    isSignIn = !isSignIn;
                  });
                },
                child: Text(isSignIn
                    ? 'Don\'t have an account? Register'
                    : 'Already have an account? Sign in'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _anonymousSignIn,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: const Text('Sign In Anonymously'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
