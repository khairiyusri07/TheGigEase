import 'package:flutter/material.dart';

import '../../../../model/postedJob.dart';

class CanceledJob extends StatefulWidget {
  const CanceledJob({super.key});

  @override
  State<CanceledJob> createState() => _CanceledJobState();
}

class _CanceledJobState extends State<CanceledJob> {
  List<jobPosted> cancelJob = List.from (postedList.where((theActiveJob) => theActiveJob.isCancel));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount:  cancelJob.length,
        itemBuilder: (context, index) {
          return CancelJobCard(cancelJob[index]);
        },
      ),
    );
  }
}


class CancelJobCard extends StatefulWidget {
  final jobPosted cancelJob;
  const CancelJobCard(
      this.cancelJob
      );

  @override
  State<CancelJobCard> createState() => _CancelJobCardState();
}

class _CancelJobCardState extends State<CancelJobCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              width: double.infinity,
              height: 70,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.shade100,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: const Offset(0,2)
                    )
                  ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.cancelJob.jobPosition}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black
                    ),
                  ),
                  Text(
                    "Posted at: ${widget.cancelJob.timePosted}",
                    style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                  )
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}

