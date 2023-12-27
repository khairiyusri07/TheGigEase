import 'package:flutter/material.dart';

import '../../../../model/postedTransporter.dart';
import 'detailTransComplete.dart';

class tCompletedJob extends StatefulWidget {
  const tCompletedJob({super.key});

  @override
  State<tCompletedJob> createState() => _tCompletedJobState();
}

class _tCompletedJobState extends State<tCompletedJob> {
  List<pTransporterJob> completeTransJob = List.from (pTransporterJobs.where((theCompleteJob) => theCompleteJob.isComplete));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount:  completeTransJob.length,
        itemBuilder: (context, index) {
          return CompleteTransJobCard(completeTransJob[index]);
        },
      ),
    );
  }
}

class CompleteTransJobCard extends StatefulWidget {
  final pTransporterJob completeJob;
  CompleteTransJobCard(
      this.completeJob
      );

  @override
  State<CompleteTransJobCard> createState() => _CompleteTransJobCardState();
}

class _CompleteTransJobCardState extends State<CompleteTransJobCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => tCompleteDetailScreen(widget.completeJob),
            ),
          );
        },
        child: Container(
          width: 200.0, // Adjust the width as needed
          height: 160,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey,
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${widget.completeJob.timeRide}',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(' RM ${widget.completeJob.fee}', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        height: 2.0,
                        color: Colors.grey, // Line color
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.circle_notifications_rounded, size: 16.0, color: Colors.blue),
                      SizedBox(width: 4.0),
                      Text('Location start: ${widget.completeJob.locationStart}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, size: 16.0, color: Colors.red),
                      SizedBox(width: 4.0),
                      Text('Location end: ${widget.completeJob.locationEnd}'),
                    ],
                  ),
                ),
              ],
            ),
          ),),
      ),
    );
  }
}
