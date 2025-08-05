import 'package:firebase_auth/firebase_auth.dart';

class LogOutServices {
  final FirebaseAuth firebaseAuth;
  LogOutServices({required this.firebaseAuth});
  Future<void> logOutReq() async {
    await firebaseAuth.signOut();
  }
}
