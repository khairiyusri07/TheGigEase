import 'package:flutter/material.dart';
import '../../../model/Society_model.dart';
import '../../../model/society_program.dart';
import '../../x_job_module/social/detailSocial.dart';
import '../../x_job_module/social/viewMoreVolunteer.dart';

class SocietyWork extends StatefulWidget {
  const SocietyWork({super.key, });


  @override
  State<SocietyWork> createState() => _SocietyWorkState();
}

class _SocietyWorkState extends State<SocietyWork> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Become a Volunteer",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewSocietyWork(),
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
              height: 160.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: societyPrograms.length >= 2 ? 2 : societyPrograms.length,
                itemBuilder: (context, index) {
                  return programListCard(program: societyPrograms[index]);
                },
              ),
            )

          ],


        ),
    );

  }
}


class programListCard extends StatelessWidget {
  final societyProgram program;
  const programListCard({required this.program});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => detailSocial(program),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),

          width: 200,
          height: 200,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Colors.grey
            )
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5,),
                Container(
                  height: 52,
                  child: Text("Program: ${program.pName}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.red,
                ),
                Text("Program detail: ${program.pDetail}",
                ),
              ],
            ),
          ),

        ),
      ),

        const Positioned(
          height: 33,
          top: 15,
          right: 5,
          child:  Icon(
            Icons.bookmark_border,
            color: Colors.red,
            size: 30,
          ),
        ),
      ],
    );
  }
}
