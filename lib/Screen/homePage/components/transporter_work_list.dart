import 'package:flutter/material.dart';
import '../../../model/transpoter_job_model.dart';
import '../../x_job_module/transpoter list/transporter_detail_screen.dart';
import '../../x_job_module/transpoter list/transporter_list_screen.dart';

class TransporterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Transporter Jobs",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  // Handle the "View More" click action
                  print("View More Clicked");
                },
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransporterJobsScreen(),
                            )
                        );
                      },
                      child: Text(
                        "View More",
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14.0,
                      color: Colors.blueGrey,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 160.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: openTranspoterJobs.length >= 5 ? 5 : openTranspoterJobs.length,
              itemBuilder: (context, index) {
                return TJobCard(job: openTranspoterJobs[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TJobCard extends StatelessWidget {
  final transporters_jobs job;

  TJobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransporterDetailScreen(job),
          ),
        );
      },
      child: Container(
        width: 200.0, // Adjust the width as needed
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8.0),
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
                        Text(' ${job.timeRide}',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text('RM${job.fee}', style: TextStyle(color: Colors.white)),
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
                    Icon(Icons.circle_outlined, size: 16.0, color: Colors.blue),
                    SizedBox(width: 4.0),
                    Text('${job.locationStart}'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.location_on, size: 16.0, color: Colors.red),
                    SizedBox(width: 4.0),
                    Text('${job.locationEnd}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
