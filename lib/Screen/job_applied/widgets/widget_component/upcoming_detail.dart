import 'package:flutter/material.dart';

import '../../../../model/job_available_model.dart';
import '../../../main_page.dart';
import '../../../message/chat_screen.dart';

class upcomingDetail extends StatelessWidget {
  final JobOpening job;

  upcomingDetail(this.job);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Job Details'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
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
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(job.poster?.imageUrl ?? ''),
                            ),
                            const SizedBox(width: 10,),
                            Text("Posted by: \n${job.poster.userName}"),
                            const SizedBox(width: 10,),
                            // Text("Date Posted: ")

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
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Positioned(
                              right: 15,
                              bottom: 10,
                              child: Text(
                                'RM ${job.jobFee} / Hour',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),)


                          ]
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Description: '),
                                  Text(job.jobDescription)
                                ],
                              ),

                            ),
                            const SizedBox(height: 16),
                            Text('Location: ${job.jobLocation}'),
                            const SizedBox(height: 8),

                            const SizedBox(height: 16),

                          ],
                        ),
                      )


                    ],
                  ),
                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                      user: job.poster
                  ),
                ),
              ),
              child: Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).primaryColor,
                ),
                child: const Text("Message", style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          GestureDetector(
            onTap: () {
              _showWithdrawAlert(context);

            },
            child: Container(
              child: const Text("Withdraw"),
            ),
          ),
          const SizedBox(height: 15,),
          GestureDetector(
            onTap: () {
              // Navigate back to the previous screen when "Close" is clicked
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
  void _showWithdrawAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: const Text("Withdraw"),
          content: Container(
            height: 50,
            child: const Column(
              children: [
                Text("Are you sure want to withdraw from this job"),
              ],
            ),
          ),
          actions: [
            SizedBox(width: 130,),
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
      },
    );
  }
}
