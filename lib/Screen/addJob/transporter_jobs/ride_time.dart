import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/homePage/home_screen.dart';
import 'package:flutter_application_1/Screen/main_page.dart';

import 'drop_off_location.dart';
import 'ride_detail.dart';

class RideTime extends StatefulWidget {
  const RideTime({super.key});

  @override
  State<RideTime> createState() => _RideTimeState();
}

class _RideTimeState extends State<RideTime> {
  String selectedContainerText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "New Transporter Jobs",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(height: 150,),
          Text("Ride time",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSelectableTime(1, "Now"),
              SizedBox(width: 20),
              buildSelectableTime(2, "Later"),
            ],
          ),
          SizedBox(height: 30,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DropOffLocation()));
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(width: 15),
                      Text("Back"),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: selectedContainerText != 0
                      ? Theme
                      .of(context)
                      .primaryColor
                      : Colors.grey,
                  // Disable button if no container is selected
                  onPrimary: selectedContainerText != 0
                      ? Colors.white
                      : Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: selectedContainerText.isNotEmpty ? () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RideDetail(
                            selectedContainerText: selectedContainerText,
                          )));
                } : null,
                // child: Container(

                child: Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 50,
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

            ],
          )
        ],

      ),


    );
  }


  Widget buildSelectableTime(int containerNumber, String text) {
    return GestureDetector(
      onTap: () {
        // Handle the tap event to toggle the selection state
        setState(() {
          selectedContainerText = text;
        });
      },
      child: Container(
        alignment: Alignment.center,

        height: 200,
        width: 120,
        decoration: BoxDecoration(
          color: selectedContainerText == text
              ? Theme
              .of(context)
              .primaryColor
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme
                .of(context)
                .primaryColor,
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedContainerText == text
                ? Colors.white
                : Theme
                .of(context)
                .primaryColor,
          ),
        ),
      ),
    );
  }


}
