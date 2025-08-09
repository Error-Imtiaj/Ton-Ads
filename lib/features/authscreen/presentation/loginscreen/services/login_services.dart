import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginServices {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FacebookAuth facebookAuth;

  LoginServices({
    required this.facebookAuth,
    required this.googleSignIn,
    required this.firebaseAuth,
  });

  // SIGN IN WITH EMAIL AND PASSWORD

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

  // SIGN IN GOOGLE

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

  // SIGN IN WITH FACEBOOK
  Future<UserCredential> signInWthFacebook() async {
    final LoginResult loginResult = await facebookAuth.login();

    // Create a credential from the access token
    if (loginResult.status == LoginStatus.success) {
      final accessToken = loginResult.accessToken;

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken!.tokenString);

      return firebaseAuth.signInWithCredential(facebookAuthCredential);
    } else {
      throw Exception("Facebook Sign-In was cancelled");
    }
  }
}
