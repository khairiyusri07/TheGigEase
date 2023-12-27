import 'package:flutter/material.dart';

import '../../../model/society_program.dart';
import '../../main_page.dart';

class detailSocial extends StatelessWidget {
  final societyProgram program;
  const detailSocial(
    this.program
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Volunteer job detail"),

      ),

      body: Column(
        children: [
          SizedBox(height: 155),
          Stack(
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),

                    width: double.infinity,
                    height: 300,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1,
                            color: Colors.grey
                        )
                    ),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5,),
                          Container(
                            height: 52,
                            child: Text("Program: ${program.pName}",
                              style: const TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.red,
                          ),
                          Text("Organiser:",style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),),
                          Text("${program.socName.societyShortName}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          Text("Program detail:",style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),),
                          Text("${program.pDetail}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          Text("Duration:",style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),),
                          Text("${program.pDuration} Days", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),

                        ],
                      ),
                    ),

                  ),
                ),
              ),

              // const Positioned(
              //   height: 33,
              //   top: 15,
              //   right: 5,
              //   child:  Icon(
              //     Icons.bookmark_border,
              //     color: Colors.red,
              //     size: 30,
              //   ),
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),

              ),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,

                ),

                onPressed: () {
                  _showApplyAlert(context);


                },
                child: Text("Apply Now", style: TextStyle(color: Colors.white)),

              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Text("Close"),
            ),
          ),
        ],
      ),
    );
  }

  void _showApplyAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: Text("Applied"),
          content: Container(
            height: 50,
            child: Column(
              children: [
                Text("You have successfully applied for this job."),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
              child: Text("Close"),
            ),


          ],
        );
      },
    );
  }
}
