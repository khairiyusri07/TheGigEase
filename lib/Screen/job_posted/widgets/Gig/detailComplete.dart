import 'package:flutter/material.dart';
import '../../../../model/postedJob.dart';


class CompleteJobDetailScreen extends StatelessWidget {
  final jobPosted completeJob;

  CompleteJobDetailScreen(this.completeJob);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Job Details'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 150,),
                Container(

                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Row(
                          children: [
                            CircleAvatar(
                            ),
                            SizedBox(width: 10,),
                            Text("Posted by: \nYou"),
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
                                      '${completeJob.jobImage}'
                                  )
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            bottom: 10,
                            child: Text(
                              completeJob.jobPosition,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            right: 15,
                            bottom: 10,
                            child: Text(
                              'RM ${completeJob.jobFee} / Hour',
                              style: const TextStyle(
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
                                  Text(completeJob.jobDescription),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text('Location: ${completeJob.jobLocation}'),
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
              height: 40,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).primaryColor,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor
                ),

                onPressed: () {
                  Navigator.pop(context);

                },
                child: const Text(
                  // job?.isApplied() == true ? 'Applied' :
                  'Close',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
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

          title: const Text("Job Applied"),
          content: Container(
            height: 50,
            child: const Column(
              children: [
                Text("You have successfully applied for this job."),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {

              },
              child: const Text("Close"),
            ),

          ],
        );
      },
    );
  }
}
