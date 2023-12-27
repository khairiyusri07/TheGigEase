import 'package:flutter/material.dart';
import '../../../model/job_available_model.dart';
import 'widget_component/history_detail.dart';

class history extends StatefulWidget {
  @override
  _historyState createState() => _historyState();
}

class _historyState extends State<history> {
  List<JobOpening> displayedJobs = List.from(openJobs.where((job) => job.isDone));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
        itemCount: displayedJobs.length,
        itemBuilder: (context, index) {
          return JobCard(displayedJobs[index]);
        },
      ),
    );
  }
}

class JobCard extends StatefulWidget {
  final JobOpening job;

  JobCard(this.job);

  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => historyDetail(widget.job),
            ),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                width: double.infinity,
                height: 192,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        width: 1
                    )
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 20,
                      alignment: AlignmentDirectional.bottomStart,
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      alignment: AlignmentDirectional.bottomStart,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Image(
                                    image: AssetImage(
                                        '${widget.job.jobImage}'
                                    )
                                ),
                              ),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.job.jobPosition,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.black
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on_outlined, size: 15,),
                                      Text( widget.job.jobLocation,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text('RM${widget.job.jobFee} / Hour' as String,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Text("Job Detail:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            widget.job.jobDescription,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
