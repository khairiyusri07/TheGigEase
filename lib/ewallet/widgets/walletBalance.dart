import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/wallet_provider.dart';
import '../read_firestore_data/wallet_firestore_balance.dart';

class WalletBalance extends StatelessWidget {
  const WalletBalance({Key? key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final walletProvider = Provider.of<WalletProvider>(context);
    List<String> docIDs = [];


// get docIDs
    Future getDocId() async {
      await FirebaseFirestore.instance.collection('users').get().then(
            (snapshot) => snapshot.docs.forEach((document) {
          print(document.reference);
          docIDs.add(document.reference.id);
        }),
      );
    }

    return Container(
      height: 100,
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Column(
          children: [
            Text(
              'Balance: ',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          Text(
            'RM ${walletProvider.balance.toStringAsFixed(2)} ',
            style: const TextStyle(
              fontSize: 45,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
            // FutureBuilder(
            //   future: getDocId(),
            //   builder: (context, snapshot) {
            //     // Check if the Future is complete
            //     if (snapshot.connectionState == ConnectionState.done) {
            //       // Use the first docID if available
            //       String documentId = docIDs.isNotEmpty ? docIDs[0] : '';
            //       // Display the user's email using GetUserName
            //       return GetWalletBalance(documentId: documentId);
            //     } else {
            //       // If the Future is not complete, show a loading indicator
            //       return CircularProgressIndicator();
            //     }
            //   },
            // ),


          ],
        ),
      ),
    );
  }
}
