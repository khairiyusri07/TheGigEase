import 'package:flutter/material.dart';

import '../../../model/society_program.dart';

class VolunteerJobPosted extends StatefulWidget {
  const VolunteerJobPosted({super.key});

  @override
  State<VolunteerJobPosted> createState() => _VolunteerJobPostedState();
}

class _VolunteerJobPostedState extends State<VolunteerJobPosted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posted Volunteer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => detailSocial(program),
          //   ),
          // );
        },
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("Active", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 ),),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),

              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1,
                      color: Colors.grey
                  )
              ),
              child: Column(
                children: [

                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),

                        Container(
                          height: 52,
                          child: Row(
                            children: [
                              Text("Program: IRKHSSS Fest ",
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(width: 10),

                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Colors.red,
                        ),
                        Text("Program detail: We are now recruiting Sub committee",
                        ),
                        Text("Organise by: IRKHSSS",
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ),
          ],
        ),
      ),



    );
  }
}
