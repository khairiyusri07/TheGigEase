
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'location_selector.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:firebase_auth/firebase_auth.dart';
import 'location_selector.dart';

class AddGigsJob extends StatefulWidget {

  const AddGigsJob({Key? key,}) : super(key: key);

  @override
  _AddGigsJobState createState() => _AddGigsJobState();
}

class _AddGigsJobState extends State<AddGigsJob> {
  DateTimeRange? _selectedDateRange;
  List<DateTime> _selectedDates = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController paymentController = TextEditingController();
  LatLng? selectedLocation;
  String? readableLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Post New Gigs Jobs",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Container(
              alignment: Alignment.center,
              color: Colors.black,
              width: double.infinity,
              height: 130,
              child: Text("Upload Image Here", style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 20),
            Container(
                alignment: Alignment.topLeft ,
                child: Text("Title of the Job")
            ),
            SizedBox(height: 15),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12)

                  ),
                  controller: titleController,
                ),
              ),
            ),
            SizedBox(height: 10,),

            Container(
                alignment: Alignment.topLeft ,
                child: Text("Description of the Job")),
            const SizedBox(height: 15),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12)

                    ),
                    controller: descriptionController,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
                alignment: Alignment.topLeft ,
                child: Text("Job Payment (Per Hour)")),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12)

                ),
                keyboardType: TextInputType.number,
                controller: paymentController,
              ),
            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 35),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: CupertinoColors.systemGrey5,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: const Text("Back"),
                  ),
                  SizedBox(width: 10),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))
                    ),
                    onPressed: () async {
                      LatLng? location = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  MapPage(
                          jobTitle: titleController.text,
                          jobDiscription: descriptionController.text,
                          jobPayment: double.tryParse(paymentController.text) ?? 0.0,



                        )
                        ),
                      );
                      if (location != null) {
                        setState(() {
                          selectedLocation = location;
                        });
                      }
                    },
                    child: const Text("Select Location"),
                  ),
                ],
              ),
            ),
            // Show selected location
            if (selectedLocation != null && readableLocation != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Selected Location: $readableLocation",
                  style: TextStyle(fontSize: 16),
                ),
              ),

            // ElevatedButton(
            //   onPressed: () {
            //     User? user = FirebaseAuth.instance.currentUser;
            //     if (user == null) {
            //       // Handle the case where the user is not authenticated
            //       // You can navigate to the login page or show an error message
            //       return;
            //     }
            //     CollectionReference collRef = FirebaseFirestore.instance.collection('gigJob');
            //     var newJobRef = collRef.doc();
            //     collRef.add({
            //       // Pass the values entered by the user
            //       'jobId': newJobRef.id,
            //       'userId': user.uid,
            //       'userName': user.displayName ?? '',
            //       'title' : titleController.text,
            //       'skills': skillsController.text,
            //       'description' : descriptionController.text,
            //       'payment': double.parse(paymentController.text),
            //       'date': _selectedDates,
            //       'location': selectedLocation != null
            //           ? GeoPoint(selectedLocation!.latitude, selectedLocation!.longitude)
            //           : null,
            //     }
            //     );
            //   },
            //   child: const Text("Save Job"),
            // ),

          ],
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      selectableDayPredicate: (DateTime day) {
        // You can customize the condition for selectable dates here
        // For example, allow only weekdays
        return true;
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDateRange = DateTimeRange(start: picked, end: picked);
        _selectedDates = _getDatesBetween(picked, picked);
      });
    }
  }


  List<DateTime> _getDatesBetween(DateTime start, DateTime end) {
    List<DateTime> dates = [];
    for (int i = 0; i <= end.difference(start).inDays; i++) {
      dates.add(start.add(Duration(days: i)));
    }
    return dates;
  }
  void _updateReadableLocation(LatLng location) async {
    try {
      List<geocoding.Placemark> placemarks =
      await geocoding.placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );
      if (placemarks.isNotEmpty) {
        setState(() {
          readableLocation = "${placemarks[0].name}, ${placemarks[0].locality}";
        });
      }
    } catch (e) {
      print("Error retrieving readable location: $e");
    }
  }
}

