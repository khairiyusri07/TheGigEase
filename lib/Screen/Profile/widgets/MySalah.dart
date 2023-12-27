import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Profile/widgets/my_account_list/edit_account.dart';
import 'package:flutter_application_1/Screen/Profile/widgets/my_account_list/my_certificate.dart';

import '../../../ewallet/wallet__main_screen.dart';
import '../prayer_time.dart';

class MySalah extends StatelessWidget {
  const MySalah({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          const Text(
            "My Salah",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          GestureDetector(
            child: Row(
              children: [
                Icon(
                  Icons.mosque,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 20,),
                const Text(
                  "Prayer Time",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ],
            ),
            onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JadualWaktuSolat()),
              );
            },
          ),

        ],
      ),

    );
  }
}
