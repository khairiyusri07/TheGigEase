import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Profile/widgets/my_account_list/edit_account.dart';
import 'package:flutter_application_1/Screen/Profile/widgets/my_account_list/my_certificate.dart';

import '../../../ewallet/wallet__main_screen.dart';
import '../page/Certificate.dart';
import '../page/Profile.dart';
import '../page/VolunteerJob.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Text(
            "My Account",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          GestureDetector(
            child: Row(
              children: [
                Icon(
                    Icons.document_scanner_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 20,),
                Text(
                    "My Certificate",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Certificate()),
            );
              },
          ),
          GestureDetector(
            child: Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 20,),
                Text(
                  "Edit Account",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
              },
          ),
          GestureDetector(
            child: Row(
              children: [
                Icon(
                  Icons.wallet, 
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 20,),
                Text(
                  "My eWallet",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WalletScreen()),
              );
            },
          ),
          GestureDetector(
            child: Row(
              children: [
                Icon(
                  Icons.volunteer_activism,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 20,),
                Text(
                  "Volunteer Job Posted",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VolunteerJobPosted()),
              );
            },
          )
        ],
      ),

    );
  }
}
