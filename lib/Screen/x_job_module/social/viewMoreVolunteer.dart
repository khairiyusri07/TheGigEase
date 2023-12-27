import 'package:flutter/material.dart';
import '../../../model/Society_model.dart';
import '../../../model/society_program.dart';
import 'detailSocial.dart';

class ViewSocietyWork extends StatefulWidget {
  const ViewSocietyWork({super.key, });


  @override
  State<ViewSocietyWork> createState() => _ViewSocietyWorkState();
}

class _ViewSocietyWorkState extends State<ViewSocietyWork> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Volunteer Work"),
      ),
      body: Container(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: societyPrograms.length ,
            itemBuilder: (context, index) {
              return programListCard(program: societyPrograms[index]);
            },
          )
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
                    Text("Organise by: ${program.socName.societyShortName}",
                    ),
                  ],
                ),
              ),

            ),
          ),

          const Positioned(
            height: 33,
            top: 25,
            right: 25,
            child:  Icon(
              Icons.bookmark_border,
              color: Colors.red,
              size: 35,
            ),
          ),
        ],


    );
  }
}
