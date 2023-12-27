import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> topUpBalance(double newBalance) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        DocumentReference documentReference = _firestore.collection('users').doc(user.uid);

        DocumentSnapshot documentSnapshot = await documentReference.get();

        if (documentSnapshot.exists) {
          double currentBalance = documentSnapshot['balance'] ?? 0.0;
          double topUpBalance = currentBalance + newBalance;

          await documentReference.update({'balance': topUpBalance});
        } else {
          print('Document does not exist.');
        }
      } else {
        print('User is not logged in.');
      }
    } catch (e) {
      print('Error updating balance: $e');
    }
  }
}
