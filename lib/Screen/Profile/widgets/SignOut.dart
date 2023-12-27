import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../login_sign_up/userAuth/login_screen/login_screen.dart';

class SignOut extends StatelessWidget {
  const SignOut({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(

          onPressed: () async {
            showLogoutConfirmationDialog(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(Icons.logout_outlined),
              Text('Log Out'),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
            
          ),
          
        ),
      ),
    );
  }
}



Future<void> _logOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    // Navigate to the login screen or any other screen as needed
    // You can use Navigator.pushReplacement or any navigation method here
  } catch (e) {
    print("Error during log out: $e");
  }
}


void showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("GigEase"),
        content: Text("Do you want to log out?"),
        actions: [
          TextButton(
            onPressed: () async {
              await _logOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            child: Text("Yes"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("No", style: TextStyle(color: Colors.white),),
          ),

        ],
      );
    },
  );
}