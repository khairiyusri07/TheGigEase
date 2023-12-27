import 'package:flutter/material.dart';

class CurrentApplicant extends StatefulWidget {

  const CurrentApplicant();

  @override
  State<CurrentApplicant> createState() => _CurrentApplicantState();
}

class _CurrentApplicantState extends State<CurrentApplicant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Applicants"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("This job received 3 application"),
            SizedBox(height: 20),
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(

                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0,2)
                    ),]

              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 90,
                      width: 5,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/profilePic/greg.jpg'),
                    ),
                    const SizedBox(width: 15),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text("Mohamad bin Abu", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("21 Years old",),
                        Text("KICT")
                      ],
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            _hireApplicant(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Theme.of(context).primaryColor
                            ),
                              child: const Text(
                                "Hire",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                          ),
                        ),
                        const Text(
                          "Message",
                          style: TextStyle(
                          fontWeight: FontWeight.bold,

                          ),
                        ),
                        const Text("Dismiss")
                      ],
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(

                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0,2)
                    ),]

              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 90,
                      width: 5,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/profilePic/james.jpg'),
                    ),
                    const SizedBox(width: 15),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text("Ali Bin Mohamad", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("24 Years old",),
                        Text("KIRKHS")
                      ],
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            _hireApplicant(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Theme.of(context).primaryColor
                            ),
                            child: const Text(
                              "Hire",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "Message",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        const Text("Dismiss")
                      ],
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(

                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0,2)
                    ),]

              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 90,
                      width: 5,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/profilePic/john.jpg'),
                    ),
                    const SizedBox(width: 15),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text("Abdulah bin Amr", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("22 Years old",),
                        Text("ENGIN")
                      ],
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            _hireApplicant(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Theme.of(context).primaryColor
                            ),
                            child: const Text(
                              "Hire",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "Message",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        const Text("Dismiss")
                      ],
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
            ),
  ],
        ),
      ),


    );
  }


  void _hireApplicant (BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: Text("Applicant Hired"),
            actions: [
              Column(
                children: [
                  TextButton(
                    onPressed: () {

                    },
                    child: const Text("Message"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);

                    },
                    child: const Text("Close"),
                  ),
                ],
              ),

            ],
          );
    });
  }



}
