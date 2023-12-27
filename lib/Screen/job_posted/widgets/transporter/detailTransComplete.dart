import 'package:flutter/material.dart';
import '../../../../model/postedTransporter.dart';
import '../../../message/chat_screen.dart';


class tCompleteDetailScreen extends StatelessWidget {
  final pTransporterJob completeJob;

  tCompleteDetailScreen(this.completeJob);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Transporter Job'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 150,),
                Container(

                  height: 250,
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
                        child: Row(
                          children: [
                            const CircleAvatar(

                            ),
                            const SizedBox(width: 10,),
                            const Text("Requested by: \nYou"),
                            const Spacer(),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Text(
                                completeJob.timeRide,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text("Location Detail: "),
                            const SizedBox(width: 15,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [

                                    const Icon(Icons.circle_outlined, size: 16.0, color: Colors.blue),
                                    const SizedBox(width: 4.0),
                                    Text('${completeJob.locationStart}'),
                                  ],
                                ),
                                Row(
                                  children: [

                                    const Icon(Icons.location_on, size: 16.0, color: Colors.red),
                                    const SizedBox(width: 4.0),

                                    Text('${completeJob.locationEnd}'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Total Payment: RM ${completeJob.fee}"),
                      )





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
                  'Close',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(height: 15,),
          // GestureDetector(
          //   onTap: () {},
          //   // => Navigator.push(
          //   //   context,
          //   //   MaterialPageRoute(
          //   //     builder: (_) => ChatScreen(
          //   //         user: job.userId
          //   //     ),
          //   //   ),
          //   // ),
          //   child: Container(
          //     child: Text("Message  "),
          //   ),
          // ),
          // SizedBox(height: 15,),
          // GestureDetector(
          //   onTap: () {
          //
          //   },
          //   child: Container(
          //     child: const Text("Close"),
          //   ),
          // ),

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
