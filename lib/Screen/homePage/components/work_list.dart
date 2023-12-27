import 'package:flutter/material.dart';
import '../../../model/job_available_model.dart';
import '../../x_job_module/job_list_screen/JobDetailScreen.dart';
import '../../x_job_module/job_list_screen/job_list_screen.dart';

class WorkSelectionGallery extends StatelessWidget {
  const WorkSelectionGallery({super.key});

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
                "Available Gigs",
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
                              builder: (context) => JobListScreen(),
                            )
                        );
                      },
                      child: const Text(
                        "View More",
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    const Icon(
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
            height: 230.0,
            width: double.infinity, // Make the width take the available width
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: openJobs.length >= 4 ? 4 : openJobs.length,
              itemBuilder: (context, index) {
                return JobCard(openJobs[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class JobCard extends StatefulWidget {
  final JobOpening jobOpening;

  const JobCard(this.jobOpening, {super.key});

  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JobDetailScreen(widget.jobOpening),
          ),
        );
      },



      child: Container(
        width: 250.0, // Adjust the width as needed
        height: 300.0, // Adjust the height as needed
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.black,
                  ),
                  child: Image(
                      image: AssetImage(
                          '${widget.jobOpening.jobImage}'
                      )
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Handle bookmark action
                        print("Bookmark Clicked");
                      },
                      icon: Icon(
                        widget.jobOpening.isBookMark
                            ? Icons.bookmark
                            :  Icons.bookmark_border,
                        color:  Colors.red,
                      ),
                    ),

                  ),
                )
              ],
            ),
            const SizedBox(height: 5,),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.jobOpening.jobPosition,
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8),
                 child: Container(
                   padding: const EdgeInsets.all(8),
                   width: 80,
                   height: 50,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                     color: Theme.of(context).primaryColor,
                   ),
                   child: Center(
                       child: Text(
                         'RM ${widget.jobOpening.jobFee} / Hours',
                         style: const TextStyle(
                             color: Colors.white, fontSize: 12 , fontWeight: FontWeight.bold
                         ),
                       )
                   ),
                 ),
               )
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Job Location:", style: TextStyle(fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      const SizedBox(width: 10,),

                      const Icon(Icons.location_on),
                      const SizedBox(width: 4),
                      Text(widget.jobOpening.jobLocation),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
