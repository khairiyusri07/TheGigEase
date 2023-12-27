import 'package:flutter/material.dart';

import '../../../../model/postedTransporter.dart';
import 'detailTransCancel.dart';

class tCanceledJob extends StatefulWidget {
  const tCanceledJob({super.key});

  @override
  State<tCanceledJob> createState() => _tCanceledJobState();
}

class _tCanceledJobState extends State<tCanceledJob> {
  List<pTransporterJob> cancelledTransJob = List.from (pTransporterJobs.where((theActiveJob) => theActiveJob.isCancel));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount:  cancelledTransJob.length,
        itemBuilder: (context, index) {
          return CancelTransJobCard(cancelledTransJob[index]);
        },
      ),
    );
  }
}



class CancelTransJobCard extends StatefulWidget {
  final pTransporterJob cancelJob;
  CancelTransJobCard(
      this.cancelJob
      );

  @override
  State<CancelTransJobCard> createState() => _CancelTransJobCardState();
}

class _CancelTransJobCardState extends State<CancelTransJobCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => tCancelDetailScreen(widget.cancelJob),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${widget.cancelJob.timeRide}',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(' RM ${widget.cancelJob.fee}', style: TextStyle(color: Colors.white)),
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
                      Text('Location start: ${widget.cancelJob.locationStart}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, size: 16.0, color: Colors.red),
                      SizedBox(width: 4.0),
                      Text('Location end: ${widget.cancelJob.locationEnd}'),
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
