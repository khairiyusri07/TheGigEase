import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Profile/widgets/general_list/help_center.dart';
import 'package:flutter_application_1/Screen/Profile/widgets/general_list/setting.dart';

import '../csv viewer.dart';
import '../prayer_time.dart';

class GeneralSetting extends StatelessWidget {
  const GeneralSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(0),
      child: Column(

        children: [
          const Text(
            "General",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          // GestureDetector(
          //   child: Row(
          //     children: [
          //       Icon(
          //         Icons.accessibility_new,
          //         color: Theme.of(context).primaryColor,
          //       ),
          //       const SizedBox(width: 20,),
          //       const Text(
          //         "Volunteer Job Posted",
          //         style: TextStyle(
          //           fontSize: 20,
          //         ),
          //       ),
          //       const SizedBox(width: 20),
          //       //Icon(Icons.arrow_forward_ios)
          //     ],
          //   ),
          //   onTap: () {},
          // ),

          GestureDetector(
            child: Row(
              children: [
                Icon(
                  Icons.help_outline,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 20,),
                const Text(
                    "Help Center",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 20),
                //Icon(Icons.arrow_forward_ios)
              ],
            ),
            onTap: () {},
          ),

          GestureDetector(
            child: Row(
              children: [
                Icon(
                  Icons.settings_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 20,),
                GestureDetector(
                    child: const Text(
                      "Setting",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => JadualWaktuSolat()),
                      // );
                    }
                ),
                //Icon(Icons.arrow_forward_ios, )
              ],
            ),
            onTap: () {
              print("Setting Pressed");
            },
          ),
        ],
      ),
    );
  }
}
