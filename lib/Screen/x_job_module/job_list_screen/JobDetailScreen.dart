import 'package:flutter/material.dart';
import '../../../model/job_available_model.dart';
import '../../homePage/home_screen.dart';
import '../../main_page.dart';

class JobDetailScreen extends StatelessWidget {
  final JobOpening job;

  JobDetailScreen(this.job);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 80,),
                Container(
                  height: 450,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                              AssetImage(job.poster?.imageUrl ?? ''),
                            ),
                            SizedBox(width: 10,),
                            Text("Posted by: \n${job.poster.userName}"),
                            SizedBox(width: 10,),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 140,
                            width: double.infinity,
                            child: Container(
                              color: Colors.black,
                              child: Image(
                                  image: AssetImage(
                                      '${job.jobImage}'
                                  )
                              ),
                            ),

                          ),
                          Positioned(
                            left: 15,
                            bottom: 10,
                            child: Text(
                              job.jobPosition,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            right: 15,
                            bottom: 10,
                            child: Text(
                              'RM ${job.jobFee} / Hour',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Description: '),
                                  Text(job.jobDescription),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text('Location: ${job.jobLocation}'),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                  job.applied = true;
                  print("applied");
                },
                child: Text("Apply Now", style: TextStyle(color: Colors.white)),

              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              child: Text( job.isBookMark? "Saved" : "Save"),
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

          title: Text("Job Applied"),
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
