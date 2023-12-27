import 'package:flutter/material.dart';

class ApplyingJob extends StatefulWidget {
  const ApplyingJob({super.key});

  @override
  State<ApplyingJob> createState() => _ApplyingJobState();
}

class _ApplyingJobState extends State<ApplyingJob> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Apply Job"),
      ),

    );
  }
}
