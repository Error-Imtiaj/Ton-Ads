import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassServices {
  final FirebaseAuth firebaseAuth;
  ForgetPassServices({required this.firebaseAuth});
  Future<void> forgetPassword(String email) async {
    return await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
