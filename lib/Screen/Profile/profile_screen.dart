import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../ewallet/wallet__main_screen.dart';
import 'components/app_bar.dart';
import 'components/app_empty_space_top.dart';
import 'prayer_time.dart';
import 'widgets/General.dart';
import 'widgets/MyAccount.dart';
import 'widgets/MySalah.dart';
import 'widgets/PersonalJobInfoBox.dart';
import 'widgets/Profile Pic.dart';
import 'widgets/SignOut.dart';

class ProfilePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileScreenAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        
          children: [
            profileEmpty(),
            ProfileInfo(),
            SizedBox(height: 20),
            PersonalJobInfoBox(),
            // JadualWaktuSolat(),






            SizedBox(height: 20,),
            MyAccount(),
            SizedBox(height: 20,),
            MySalah(),
            SizedBox(height: 20,),

            GeneralSetting(),
            SizedBox(height: 40,),
        
            SignOut(),

            ],
        ),
      ),
    );
  }
}

