

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/model/user_model.dart';

import 'Global.dart';

class AssistantMethods {
  static void readCurrentOnLineUserInfo() async{
    currentUser = firebaseAuth.currentUser;
    DatabaseReference userRef = FirebaseDatabase.instance
        .ref()
        .child("users")
        .child(currentUser!.uid);

    userRef.once().then((snap){
      if(snap.snapshot.value != null){
        var userModelCurrentInfo = User.fromSnapshot(snap.snapshot);
      }
    });
  }
}