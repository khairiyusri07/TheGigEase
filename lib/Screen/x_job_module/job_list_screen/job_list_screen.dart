import 'package:flutter/material.dart';
import '../../../model/job_available_model.dart';
import '../../../model/user_model.dart';
import 'JobDetailScreen.dart';

class JobListScreen extends StatefulWidget {
  @override
  _JobListScreenState createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  List<JobOpening> displayedJobs = List.from(openJobs);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gigs Available'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: JobSearch(openJobs));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: displayedJobs.length,
        itemBuilder: (context, index) {
          return JobCard(displayedJobs[index]);
        },
      ),
    );
  }
}

class JobSearch extends SearchDelegate<JobOpening> {
  final List<JobOpening> jobs;

  JobSearch(this.jobs);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '' as JobOpening);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement the search results based on the query
    List<JobOpening> searchResults = jobs
        .where((job) =>
    job.jobPosition.toLowerCase().contains(query.toLowerCase()) ||
        job.jobLocation.toLowerCase().contains(query.toLowerCase()) ||
        job.jobFee.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return JobCard(searchResults[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // You can implement search suggestions here if needed
    return Container();
  }
}

class JobCard extends StatefulWidget {
  final JobOpening job;

  JobCard(this.job);

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
            builder: (context) => JobDetailScreen(widget.job),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.job.jobPosition,
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.job.isBookMark = !widget.job.isBookMark;

                        });
                      },
                      icon: Icon(
                        widget.job.isBookMark
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: widget.job.isBookMark ? Colors.green : Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 4),
                        Text(widget.job.jobLocation),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 4),
                        Text(' RM ${widget.job.jobFee} / Hour' ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
