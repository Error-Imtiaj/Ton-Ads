import 'package:firebase_auth/firebase_auth.dart';

class AuthException {

  // LOGIN EXCEPTION 
  static String loginExecptionMsg(FirebaseAuthException e) {
    String errorMessage;
    switch (e.code) {
      case 'invalid-email':
        errorMessage = 'The email address is not valid.';
        break;
      case 'user-disabled':
        errorMessage = 'This user has been disabled. Please contact support.';
        break;
      case 'user-not-found':
        errorMessage = 'No user found with this email.';
        break;
      case 'wrong-password':
        errorMessage = 'Incorrect password. Please try again.';
        break;
      case 'too-many-requests':
        errorMessage = 'Too many login attempts. Please try again later.';
        break;
      case 'network-request-failed':
        errorMessage = 'Network error. Please check your connection.';
        break;
      case 'operation-not-allowed':
        errorMessage = 'Email/password accounts are not enabled.';
        break;
      case 'invalid-credential':
        errorMessage = 'Invalid credentials provided.';
        break;
      case 'internal-error':
        errorMessage = 'Internal server error. Please try again later.';
        break;
      default:
        errorMessage = e.message ?? 'Login failed. Please try again.';
        break;
    }
    return errorMessage;
  }
  // SIGN UP EXCEPTION 
   static String signupExceptionMsg(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'This email is already in use. Please try logging in.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled.';
      case 'weak-password':
        return 'The password is too weak. Please use a stronger password.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return e.message ?? 'Sign up failed. Please try again.';
    }
  }
}
