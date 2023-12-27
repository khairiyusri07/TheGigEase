import 'package:flutter/material.dart';
import '../../../../model/postedTransporter.dart';
import '../../../message/chat_screen.dart';


class tCancelDetailScreen extends StatelessWidget {
  final pTransporterJob cancelJob;

  tCancelDetailScreen(this.cancelJob);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canceled Transporter Job'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 150,),
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
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(

                            ),
                            SizedBox(width: 10,),
                            Text("Requested by: \nYou"),
                            Spacer(),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Text(
                                cancelJob.timeRide,
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
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Location Detail: "),
                            SizedBox(width: 15,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [

                                    Icon(Icons.circle_outlined, size: 16.0, color: Colors.blue),
                                    SizedBox(width: 4.0),
                                    Text('${cancelJob.locationStart}'),
                                  ],
                                ),
                                Row(
                                  children: [

                                    Icon(Icons.location_on, size: 16.0, color: Colors.red),
                                    SizedBox(width: 4.0),

                                    Text('${cancelJob.locationEnd}'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Total Payment: RM ${cancelJob.fee}"),
                      )





                    ],
                  ),
                ),

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
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
                child: Text(
                  // job?.isApplied() == true ? 'Applied' :
                  'Close',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),

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

              },
              child: Text("Close"),
            ),

          ],
        );
      },
    );
  }
}
