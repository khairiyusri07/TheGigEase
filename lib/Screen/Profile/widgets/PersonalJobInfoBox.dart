import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firestore_data/get_user_rating.dart';

class PersonalJobInfoBox extends StatefulWidget {
  @override
  _PersonalJobInfoBox createState() => _PersonalJobInfoBox();
}

class _PersonalJobInfoBox extends State<PersonalJobInfoBox> {
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
    return  Column(


      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade400
              ),
              color: Colors.grey.shade200

            ),

            width: 250,
            height: 99,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 90,
                  width: 100,
                  alignment: Alignment.center,
                  child: const Column(

                    children: [
                      SizedBox(height: 10,),

                      Text(
                        " Rating",
                        style: TextStyle(fontWeight: FontWeight.bold,),),
                      SizedBox(height: 15,),
                      Text(
                        " 5.0",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),


                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 1,
                  child: Container(color: Colors.grey.shade400),),

                Padding(
                  padding:  const EdgeInsets.all(8.0),
                  child: Container(

                    height: 90,
                    width: 100,
                    alignment: Alignment.center,
                    child:  const Column(
                      children: [
                        SizedBox(height: 5,),
                        Text("         Total \nHours Worked:", style: TextStyle(fontWeight: FontWeight.bold),),

                        Text('0',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                          ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
