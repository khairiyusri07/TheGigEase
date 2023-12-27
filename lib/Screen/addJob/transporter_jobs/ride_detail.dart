import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/homePage/home_screen.dart';

import '../../main_page.dart';
import 'ride_time.dart';

class RideDetail extends StatefulWidget {
  final String selectedContainerText;
  const RideDetail({super.key, required this.selectedContainerText});

  @override
  State<RideDetail> createState() => _RideDetailState();
}

class _RideDetailState extends State<RideDetail> {

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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your ride Detail",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: const EdgeInsets.all(40),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey
                )
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle_outlined,color: Colors.red,),
                      SizedBox(width: 25),
                      Text("Mahallah Faruq", style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,color: Colors.blue,),
                      SizedBox(width: 25,),
                      Text("LRT Gombak", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const Text("Fare: RM 10"),
            SizedBox(height: 10,),
            Text("Ride Time: ${widget.selectedContainerText}"),
            SizedBox(height: 10,),
            Row(
              children: [
                const Text(
                    "Pay Through:"
                ),
                const SizedBox(width: 15,),
                Row(
                  children: [
                    buildSelectablePaymentMethod(1, "eWallet"),
                    SizedBox(width: 20),
                    buildSelectablePaymentMethod(2, "Credit Card"),
                  ],
                ),

              ],
            ),

            const SizedBox(height: 80,),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: selectedContainerText != 0
                    ? Theme.of(context).primaryColor
                    : Colors.grey, // Disable button if no container is selected
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
                    MaterialPageRoute(builder: (context) => const MainPage()));
                _confirmButton(context);
              }: null,
              // child: Container(

              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                child: const Text(
                    "Confirm and make payment",
                    style: TextStyle(
                        fontSize: 17,
                    ),
                  ),
              ),
              ),
            const SizedBox(height: 10),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  RideTime()));
                  },
                  child: Container(
                    child: const Row(
                      children: [
                        Icon(Icons.arrow_back),
                        SizedBox(width: 10,),
                        Text("Back")
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 60),
                GestureDetector(
                  onTap: (){
                    _cancelButton(context);
                  },
                    child: const Text("Cancel"))
              ],
            )


          ],
        ),
      ),
    );

  }

  Widget buildSelectablePaymentMethod(int containerNumber, String text) {
    return GestureDetector(
      onTap: () {
        // Handle the tap event to toggle the selection state
        setState(() {
          selectedContainerText = text;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: selectedContainerText == text
              ? Theme.of(context).primaryColor
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedContainerText == text
                ? Colors.white
                : Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
  void _confirmButton(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 80,
              child: const Column(
                children: [
                  Text(
                    "Your job has been posted",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),

                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Okay"),
              ),

            ],


          );
        });
  }
  void _cancelButton(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 80,
              child: const Column(
                children: [
                  Text(
                    "Are you sure to cancel?",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),

                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()));
                },
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No"),
              ),
            ],


          );
        });
  }
}
