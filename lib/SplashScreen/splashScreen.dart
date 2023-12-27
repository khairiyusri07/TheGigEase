import 'dart:async';
import 'package:flutter/material.dart';
import '../Screen/main_page.dart';
import '../login_sign_up/userAuth/login_screen/login_screen.dart';
import '../model/Assistants.dart';
import '../model/Global.dart';

class SplahScreen extends StatefulWidget {
  const SplahScreen({super.key});

  @override
  State<SplahScreen> createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  startTimer() {
    Timer(Duration(seconds: 3), () async {
      if(await firebaseAuth.currentUser != null){
        firebaseAuth.currentUser != null ? AssistantMethods.readCurrentOnLineUserInfo(): null;
        Navigator.push(context, MaterialPageRoute(builder: (c)  => MainPage()));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (c)  => LoginScreen()));
      }
    }
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Text('   IIUM \nGigEase', style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold
        ),
        ),

      ),
    );
  }
}
