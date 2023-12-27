import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0.0,
      ),



      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/profilePic/greg.jpg'),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:  Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 80,
                        child: const Text(
                            "Name "
                        ),
                    ),
                    const Text(
                        ": Khairi Yusri"
                    ),
                    const Icon(Icons.edit,size: 15, )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 80,
                        child: Text("User Name")),
                    Text(": khairiyusri07"),
                    Icon(Icons.edit, size: 15,)
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 80,
                        child: const Text("Password")),
                    const Text(": A********3"),
                    const Icon(Icons.edit, size: 15,)
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 80,
                        child: Text("e-Mail")),
                    Text(": khairiyusri07@gmail.com"),
                    Icon(Icons.edit, size: 15,)
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 80,
                        child: const Text("Birth Date")),
                    const Text(": 3/5/1993"),
                    const Icon(Icons.edit, size: 15,)
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 80,
                        child: const Text("IC number")),
                    const Text(": 930503051234"),
                    const Icon(Icons.edit, size: 15,)
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 80,
                        child: const Text("Student Number")),
                    const Text(": 65448916"),
                    const Icon(Icons.edit, size: 15,)
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 80,
                        child: const Text("Address")),
                    const Text(": Mahallah Faruk, IIUM"),
                    const Icon(Icons.edit, size: 15,)
                  ],
                ),

              ],
            ),
          ),



        ],
      ),
    );
  }
}
