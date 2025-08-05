import 'package:firebase_auth/firebase_auth.dart';

class SignUpAuth {
  final FirebaseAuth _firebaseAuth;
  SignUpAuth({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  // SIGN UP WITH EMAIL
  Future<UserCredential> signUpUsingEmail(String email, String pass) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
    }on FirebaseAuthException catch (e) {
        // You can handle different error codes here
      throw Exception(e.message ?? "An error occured");
    }
  }
}
