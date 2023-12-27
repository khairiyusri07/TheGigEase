import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Profile/profile_screen.dart';
import 'homePage/home_screen.dart';
import 'job_applied/job_applied_screen.dart';
import 'job_posted/job_posted_screen.dart';
import 'message/message_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomeScreen(),
    JobPostedScreen(),
    JobAppliedScreen(),
    MessagesScreen(),
    ProfilePage(),
  ];

  int currentIndext=0;

  void onTap(int index) {
    print("Tapped on index $index");
    Future.delayed(Duration(milliseconds: 50), () {
      setState(() {
        currentIndext = index;
      });
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndext],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 8,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndext,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Posted", icon: Icon(Icons.work_outlined)),
          BottomNavigationBarItem(label: "My Gigs", icon: Icon(CupertinoIcons.doc_append)),
          BottomNavigationBarItem(label: "Message", icon: Icon(Icons.message_outlined)),
          BottomNavigationBarItem(label: "My", icon: Icon(Icons.person)),
        ],
      ),


    );
  }
}
