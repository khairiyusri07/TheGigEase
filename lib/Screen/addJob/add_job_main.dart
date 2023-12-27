import 'package:flutter/material.dart';

import 'addVolunteer.dart';
import 'gig_jobs/add_gigs_jobs.dart';
import 'transporter_jobs/add_transporter_job.dart';

class AddJobMainPage extends StatefulWidget {
  const AddJobMainPage({super.key});

  @override
  State<AddJobMainPage> createState() => _AddJobMainPageState();
}

class _AddJobMainPageState extends State<AddJobMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Post a new Job",
          style: TextStyle(
              color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,

    ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Choose Job Type:",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),

          GestureDetector(
            child: Container(
              height: 120,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20),),
                color: Theme.of(context).primaryColor
            ),
              child: const Center(
                  child: Text(
                    "Gig",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddGigsJob()),);
            },
          ),
          const SizedBox(height: 20,),
          GestureDetector(
            child: Container(
              height: 120,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20),),
                color: Theme.of(context).primaryColor
              ),
              child: const Center(
                child: Text(
                    "Transpoter",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),

                ),

              ),

            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddTransporterJobs()),);
            },
          ),
          const SizedBox(height: 20,),
          GestureDetector(
            child: Container(
              height: 120,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20),),
                  color: Theme.of(context).primaryColor
              ),
              child: const Center(
                child: Text(
                  "Volunteer",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),

                ),

              ),

            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const addVolunteer()),);
            },
          ),
        ],
      ),
    );
  }
}
