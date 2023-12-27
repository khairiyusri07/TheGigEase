import 'package:flutter/material.dart';
import '../../../../model/postedJob.dart';
import '../../../main_page.dart';
import '../../applicant.dart';


class ActiveJobDetailScreen extends StatelessWidget {
  final jobPosted activeJob;

  ActiveJobDetailScreen(this.activeJob);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [

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
                                      '${activeJob.jobImage}'
                                  )
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            bottom: 10,
                            child: Text(
                              activeJob.jobPosition,
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
                              'RM ${activeJob.jobFee} / Hour',
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
                                  Text(activeJob.jobDescription),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text('Location: ${activeJob.jobLocation}'),
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
                  // _showApplyAlert(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CurrentApplicant(),
                      )
                  );

                },
                child: const Text(
                  // job?.isApplied() == true ? 'Applied' :
                  'View Applicants',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          GestureDetector(
            onTap: () {
            },

            child: Container(
              child: const Text("Edit job"),
            ),
          ),
          const SizedBox(height: 15,),
          GestureDetector(
            onTap: () {
              _cancelJob (context);
            },

            child: Container(
              child: const Text("Cancel Job"),
            ),
          ),
          const SizedBox(height: 15,),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: const Text("Close"),
            ),
          ),

        ],
      ),
    );
  }



  void _cancelJob (BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
      return AlertDialog(

        title: Text("Cancel Job"),
        content: Container(
          height: 50,
          child: Column(
            children: [
              Text("Are you sure to cancel this job?"),
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
            child: Text("Yes"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("No"),
          ),

        ],
      );
    });
  }
}
