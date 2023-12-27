import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetWalletBalance extends StatelessWidget {
  final String documentId;
  GetWalletBalance({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<QuerySnapshot>(
      future: users.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          QuerySnapshot data = snapshot.data!;

          // Get the current authenticated user
          User? currentUser = FirebaseAuth.instance.currentUser;

          // Find the document where authUid matches currentUser.uid
          var matchingDocument = data.docs.firstWhere(
                (doc) => doc['authUid'] == currentUser?.uid,

          );

          if (matchingDocument != null) {
            // If a match is found, display the email
            return Text('RM ${matchingDocument['balance']}', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),);
          } else {
            // If no match is found, handle it accordingly
            return Text('Unauthorized access');
          }
        }
        // You need to return a Widget in the builder
        return Text('Loading...');
      },
    );
  }
}


class GetWalletBalanceFont extends StatelessWidget {
  final String documentId;
  GetWalletBalanceFont({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<QuerySnapshot>(
      future: users.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          QuerySnapshot data = snapshot.data!;

          // Get the current authenticated user
          User? currentUser = FirebaseAuth.instance.currentUser;

          // Find the document where authUid matches currentUser.uid
          var matchingDocument = data.docs.firstWhere(
                (doc) => doc['authUid'] == currentUser?.uid,

          );

          if (matchingDocument != null) {
            // If a match is found, display the email
            return Text('RM ${matchingDocument['balance']}');
          } else {
            // If no match is found, handle it accordingly
            return Text('Unauthorized access');
          }
        }
        // You need to return a Widget in the builder
        return Text('Loading...');
      },
    );
  }
}

