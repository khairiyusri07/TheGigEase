import 'package:flutter/material.dart';

import 'job_review.dart';

class SetPreferences extends StatefulWidget {
  final String jobTitle;
  final String jobDiscription;
  final double jobPayment;
  const SetPreferences({Key? key, required this.jobTitle, required this.jobDiscription, required this.jobPayment}) : super(key: key);

  @override
  State<SetPreferences> createState() => _SetPreferencesState();
}

class _SetPreferencesState extends State<SetPreferences> {
  int selectedContainer = 0;
  String selectedContainerText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Set Posting Preferences",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Container(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSelectableContainer(1, "Student Only"),
                SizedBox(width: 20,),

                buildSelectableContainer(2, "Disabled Student only"),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(35, 20, 35, 0),
              child: buildSelectableContainer(3, "Open to All"),
            ),
          ),
          selectedContainer != 0
              ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
              "Selected box is: $selectedContainerText",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          )
              : SizedBox.shrink(),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:82,vertical: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous screen
                  },
                  child: const Text("Back"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: selectedContainerText != 0
                        ? Theme.of(context).primaryColor
                        : Colors.grey, // Disable button if no container is selected
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: selectedContainerText.isNotEmpty
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ReviewJob(
                        selectedContainerText: selectedContainerText,
                        jobTitle: widget.jobTitle,
                        jobDiscription: widget.jobDiscription,
                          jobPayment:widget.jobPayment,
                        )));
                  }
                      : null,
                  child: Text("Continue"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSelectableContainer(int containerNumber, String text) {
    return GestureDetector(
      onTap: () {
        // Handle the tap event to toggle the selection state
        setState(() {
          selectedContainerText = text;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 160,
        width: 120,
        decoration: BoxDecoration(
          color: selectedContainerText == text
              ? Theme.of(context).primaryColor
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              color: selectedContainerText == text
                  ? Colors.white
                  : Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
