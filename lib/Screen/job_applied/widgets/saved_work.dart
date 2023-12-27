import 'package:flutter/material.dart';
import '../../../model/job_available_model.dart';
import '../../../model/user_model.dart';
import '../../x_job_module/job_list_screen/JobDetailScreen.dart';
import 'widget_component/saved_detail.dart';

class SavedWork extends StatefulWidget {
  @override
  _SavedWorkState createState() => _SavedWorkState();
}

class _SavedWorkState extends State<SavedWork> {
  List<JobOpening> displayedJobs = List.from(openJobs.where((job) => job.isBookMark));

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
              builder: (context) => savedDetail(widget.job),
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
                      decoration: BoxDecoration(
                          color: Colors.red.shade300
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
                                  Row(
                                    children: [
                                      Text(
                                        widget.job.jobPosition,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.black
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            widget.job.isBookMark = !widget.job.isBookMark;

                                          });
                                        },
                                        icon: Icon(
                                          widget.job.isBookMark
                                              ? Icons.bookmark
                                              : Icons.bookmark_border,
                                          color: Theme.of(context).primaryColor
                                        ),
                                      ),
                                    ],
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
                          SizedBox(height: 5),
                          Text("Job Detail:",
                            style: const TextStyle(
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
