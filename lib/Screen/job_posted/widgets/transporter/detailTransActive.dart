import 'package:flutter/material.dart';
import '../../../../model/postedTransporter.dart';
import '../../../message/chat_screen.dart';
import '../../applicant.dart';


class tActiveJobDetailScreen extends StatelessWidget {
  final pTransporterJob activeJob;

  tActiveJobDetailScreen(this.activeJob);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Transporter Job'),
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
                                activeJob.timeRide,
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
                                    Text('${activeJob.locationStart}'),
                                  ],
                                ),
                                Row(
                                  children: [

                                    const Icon(Icons.location_on, size: 16.0, color: Colors.red),
                                    const SizedBox(width: 4.0),

                                    Text('${activeJob.locationEnd}'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Total Payment: RM ${activeJob.fee}"),
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
              _CancelAlert(context);
            } ,
            child: Container(
              child: const Text("Cancel Job "),
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
  void _CancelAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: const Text("Cancelation"),
          content: Container(
            height: 50,
            child: const Column(
              children: [
                Text("You are about to cancel this job, are you sure?"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);

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
