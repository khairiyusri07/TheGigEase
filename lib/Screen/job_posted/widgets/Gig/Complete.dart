import 'package:flutter/material.dart';

import '../../../../model/postedJob.dart';
import 'detailComplete.dart';

class CompletedJob extends StatefulWidget {
  const CompletedJob({super.key});

  @override
  State<CompletedJob> createState() => _CompletedJobState();
}

class _CompletedJobState extends State<CompletedJob> {
  List<jobPosted> completeJob = List.from (postedList.where((theActiveJob) => theActiveJob.isDone));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount:  completeJob.length,
        itemBuilder: (context, index) {
          return CompleteJobCard(completeJob[index]);
        },
      ),
    );
  }
}


class CompleteJobCard extends StatefulWidget {
  final jobPosted completeJob;
  const CompleteJobCard(
      this.completeJob
      );



  @override
  State<CompleteJobCard> createState() => _CompleteJobCardState();
}

class _CompleteJobCardState extends State<CompleteJobCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CompleteJobDetailScreen(widget.completeJob),
            ),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                width: double.infinity,
                height: 188,
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
                      height: 30,
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
                                        '${widget.completeJob.jobImage}'
                                    )
                                ),
                              ),
                              const SizedBox(width: 5),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.completeJob.jobPosition}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.black
                                    ),
                                  ),
                                  // Text("${widget.completeJob.jobDescription}",
                                  //   style: const TextStyle(
                                  //     fontWeight: FontWeight.normal,
                                  //     fontSize: 15,
                                  //   ),
                                  // ),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on_outlined, size: 15,),
                                      Text("${widget.completeJob.jobLocation}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text("RM ${widget.completeJob.jobFee} / hour",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          const SizedBox(height: 10),

                          Row(
                            children: [
                              const Icon(Icons.calendar_month_sharp),
                              Text("${widget.completeJob.timePosted}")
                            ],
                          )

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

