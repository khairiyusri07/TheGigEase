import 'package:flutter/material.dart';
import '../../../model/transpoter_job_model.dart';
import '../../main_page.dart';
import '../../message/chat_screen.dart';

class TransporterDetailScreen extends StatelessWidget {
  final transporters_jobs job;

  TransporterDetailScreen(this.job);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transporter Job Details'),
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
                            CircleAvatar(
                              backgroundImage: AssetImage(job.userId?.imageUrl ?? ''),
                            ),
                            const SizedBox(width: 10,),
                            Text("Requested by: \n${job.userId.userName}"),
                            const Spacer(),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(10)
                                ),

                                child: Text(
                                    job.timeRide,
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
                                    Text('${job.locationStart}'),
                                  ],
                                ),
                                Row(
                                  children: [

                                    const Icon(Icons.location_on, size: 16.0, color: Colors.red),
                                    const SizedBox(width: 4.0),

                                    Text('${job.locationEnd}'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Total Payment: RM ${job.fee}"),
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
                  _showApplyAlert(context);
                  job.applied = true;
                  print("applied");
                  job?.toggleApplied();
                },
                child: Text(
                  job?.isApplied() == true ? 'Applied' : 'Apply Now',
                  style: TextStyle(
                      color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatScreen(
                    user: job.userId
                ),
              ),
            ),
            child: Container(
              child: Text("Message ${job.userId.userName} "),
            ),
          ),
          const SizedBox(height: 15,),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            },
            child: Container(
              child: const Text("Close"),
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
