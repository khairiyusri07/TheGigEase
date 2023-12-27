import 'package:flutter/material.dart';

class Certificate extends StatefulWidget {
  const Certificate({super.key});

  @override
  State<Certificate> createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("My Certificate", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(

                  height: 600,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Image.asset("assets/images/thyphoid_vacination-02-656x1024.jpg")
                ),
                Positioned(
                  bottom: 0,

                  child: Container(
                    width: 600,
                    height: 140,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    width: 90,
                    height: 120,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 110,
                  child: Container(
                    width: 90,
                    height: 120,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 210,
                  child: Container(
                    width: 90,
                    height: 120,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              alignment: AlignmentDirectional.center,
              width: 600,
              height: 70,

              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadiusDirectional.circular(10)
              ),
              child: Text("Upload New Certificate", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
            ),
          )

        ],
      ),
    );
  }
}
