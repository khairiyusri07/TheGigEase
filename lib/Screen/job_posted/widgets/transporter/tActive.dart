import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/job_posted/widgets/transporter/detailTransActive.dart';

import '../../../../model/postedTransporter.dart';

class tActiveJob extends StatefulWidget {
  @override
  _tActiveJobState createState() => _tActiveJobState();
}

class _tActiveJobState extends State<tActiveJob> {
  List<pTransporterJob> activeTransJob = List.from (pTransporterJobs.where((theActiveJob) => !theActiveJob.isComplete));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount:  activeTransJob.length,
          itemBuilder: (context, index) {
            return ActiveTransJobCard(activeTransJob[index]);
          },
      ),
    );
  }
}

class ActiveTransJobCard extends StatefulWidget {
  final pTransporterJob activeJob;
  ActiveTransJobCard(
      this.activeJob
      );

  @override
  State<ActiveTransJobCard> createState() => _ActiveTransJobCardState();
}

class _ActiveTransJobCardState extends State<ActiveTransJobCard> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => tActiveJobDetailScreen(widget.activeJob),
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
                  color: Theme.of(context).primaryColor,
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${widget.activeJob.timeRide}',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(' RM ${widget.activeJob.fee}', style: TextStyle(color: Colors.white)),
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
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.circle_notifications_rounded, size: 16.0, color: Colors.blue),
                      SizedBox(width: 4.0),
                      Text('Location start: ${widget.activeJob.locationStart}'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, size: 16.0, color: Colors.red),
                      SizedBox(width: 4.0),
                      Text('Location end: ${widget.activeJob.locationEnd}'),
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

