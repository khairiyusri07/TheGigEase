import 'package:flutter/material.dart';

class addVolunteer extends StatefulWidget {
  const addVolunteer({super.key});

  @override
  State<addVolunteer> createState() => _addVolunteerState();
}

class _addVolunteerState extends State<addVolunteer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Volunteer Jobs",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Program Name:"),
            SizedBox(height: 5,),
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
                    )
                  ),
              ),
            ),
            SizedBox(height: 10,),
            Text("Program Detail:"),
            SizedBox(height: 5,),
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
                    )
                ),
              ),
            ),
            SizedBox(height: 10,),

            Text("Organiser:"),
            SizedBox(height: 5,),
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
                    )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text("Date of the program:"),
            SizedBox(height: 5,),
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
                    )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text("Program Duration:"),
            SizedBox(height: 5,),
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
                    )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text("Job poster position in the club/society:"),
            SizedBox(height: 5,),
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
                    )
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey
                      ),
                      child: Text("Cancel"),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      _submitButton(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).primaryColor
                      ),
                      child: Text("Submit",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )


          ],
        ),
      ),

      
    );
  }

  void _submitButton (BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: Text("New Volunteer Job listing has been submitted, please contact admin@GigEase.com or wait up to three days for approval"),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("Okay"))
            ],
          );

    });
  }
}
