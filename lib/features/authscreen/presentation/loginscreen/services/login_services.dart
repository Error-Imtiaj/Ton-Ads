import 'package:firebase_auth/firebase_auth.dart';

class LoginServices {
  final FirebaseAuth firebaseAuth;

  LoginServices({required this.firebaseAuth});

  Future<UserCredential> loginRequest(String email, String pass) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "AN ERROR OCCURED";
    }
  }
}
