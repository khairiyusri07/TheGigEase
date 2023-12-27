import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../firebase_services/firebase_service.dart';
import '../firestore_data/get_user_name.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
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
    return Column(
      children: [
        const CircleAvatar(
          radius: 90,
          backgroundImage: AssetImage('assets/images/profilePic/greg.jpg'),
        ),
        SizedBox(height: 10,),
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


      ],
    );
  }
}
