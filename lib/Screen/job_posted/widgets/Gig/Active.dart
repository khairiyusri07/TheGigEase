import 'package:flutter/material.dart';

import '../../../../model/postedJob.dart';
import 'detailActive.dart';

class ActiveJob extends StatefulWidget {
  const ActiveJob({super.key});

  @override
  State<ActiveJob> createState() => _ActiveJobState();
}

class _ActiveJobState extends State<ActiveJob> {
  List<jobPosted> activeJob = List.from (postedList.where((theActiveJob) => !theActiveJob.isDone));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount:  activeJob.length,
        itemBuilder: (context, index) {
          return ActiveJobCard(activeJob[index]);
        },
      ),
    );
  }
}


class ActiveJobCard extends StatefulWidget {
  final jobPosted activeJob;
  const ActiveJobCard(
      this.activeJob
      );

  @override
  State<ActiveJobCard> createState() => _ActiveJobCardState();
}

class _ActiveJobCardState extends State<ActiveJobCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActiveJobDetailScreen(widget.activeJob),
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
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor
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
                                        '${widget.activeJob.jobImage}'
                                    )
                                ),
                              ),
                              const SizedBox(width: 5),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.activeJob.jobPosition}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.black
                                    ),
                                  ),
                                  // Text(
                                  //   '${widget.activeJob.jobDescription}',
                                  //   style: const TextStyle(
                                  //     fontWeight: FontWeight.normal,
                                  //     fontSize: 15,
                                  //   ),
                                  // ),
                                   Row(
                                    children: [
                                      const Icon(Icons.location_on_outlined, size: 15,),
                                      Text("${widget.activeJob.jobLocation} ",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'RM ${widget.activeJob.jobFee} / hour',
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
                              Text("${widget.activeJob.timePosted}")
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
