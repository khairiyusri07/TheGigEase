import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firestore_data/get_user_name.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final user = FirebaseAuth.instance.currentUser!;
  // document IDs
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(
        children: [
          Text('List of user'),
          // Use FutureBuilder to wait for getDocId() to complete
          FutureBuilder(
            future: getDocId(),
            builder: (context, snapshot) {
              // Check if the Future is complete
              if (snapshot.connectionState == ConnectionState.done) {
                // Use the first docID if available
                String documentId = docIDs.isNotEmpty ? docIDs[0] : '';
                // Display the user's email using GetUserName
                return GetUserName(documentId: documentId);
              } else {
                // If the Future is not complete, show a loading indicator
                return CircularProgressIndicator();
              }
            },
          ),
          Text("check"),
        ],
      ),
    );
  }
}
