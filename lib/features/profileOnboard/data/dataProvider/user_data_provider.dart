import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earn_watching_ads/features/profileOnboard/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataProvider {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  UserDataProvider( {required this.firebaseAuth, required this.firebaseFirestore});

  // * ADD OR UPDATE USER DETAILS
  Future<void> addOrUpdatePerson(UserModel person) async {
    try {
      final uid = firebaseAuth.currentUser!.uid; // current user id
      await firebaseFirestore
          .collection('users')
          .doc(uid) // one document per user
          .set(person.toMap()); // set will overwrite existing doc
          print("Firestore write executed for uid: $uid");

      print("Person added/updated successfully!");
    } catch (e) {
      print("Error adding/updating person: $e");
    }
  }

  // * GET DETAILS FROM FIREBASE
  Future<DocumentSnapshot?> getPerson() async {
    try {
      final uid = firebaseAuth.currentUser!.uid;
      final docSnapshot =
          await firebaseFirestore.collection('users').doc(uid).get();

      if (docSnapshot.exists) {
        return docSnapshot;
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching person: $e");
      return null;
    }
  }
}
