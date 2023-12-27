import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> getName(String authUid) async {
    DocumentSnapshot snapshot = await _firestore
        .collection('users') // Replace with your actual collection name
        .doc(authUid) // Replace with the actual authUid (should be a string)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return data['name'] as String? ?? ''; // Use the null-aware operator to handle null values
    } else {
      return '';
    }
  }
}
