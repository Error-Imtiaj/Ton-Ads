import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpAuth {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  SignUpAuth({required this.firebaseAuth, required this.googleSignIn});

  // SIGN UP WITH EMAIL
  Future<UserCredential> signUpUsingEmail(String email, String pass) async {
    try {
      return await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
    } on FirebaseAuthException catch (e) {
      // You can handle different error codes here
      throw Exception(e.message ?? "An error occured");
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? gUser = await googleSignIn.signIn();

    if (gUser == null) {
      throw Exception("Google Sign-In was cancelled");
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Sign in with the credential
    return await firebaseAuth.signInWithCredential(credential);
  }
}
