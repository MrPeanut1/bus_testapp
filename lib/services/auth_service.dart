import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
    
  }
}



  // Future<UserCredential?> signInWithEmailPassword(
  //     String email, String password) async {
  //   try {
  //     return await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } catch (e) {
  //     print("Error signing in: $e");
  //     return null;
  //   }
  // }

  // Future<void> sendEmailVerification() async {
  //   try {
  //     User? user = _auth.currentUser;
  //     await user!.sendEmailVerification();
  //   } catch (e) {
  //     print("Error sending email verification: $e");
  //   }
  // }

  // Future<void> registerUserWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     print("User registered successfully");
  //   } catch (e) {
  //     print("Error registering user: $e");
  //   }
