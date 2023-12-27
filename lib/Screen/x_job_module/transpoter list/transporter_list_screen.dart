import 'package:flutter/material.dart';
import '../../../model/transpoter_job_model.dart';
import 'transporter_detail_screen.dart'; // Assuming you have this import

class TransporterJobsScreen extends StatefulWidget {
  @override
  _TransporterJobsScreenState createState() => _TransporterJobsScreenState();
}

class _TransporterJobsScreenState extends State<TransporterJobsScreen> {
  List<transporters_jobs> displayedJobs = List.from(openTranspoterJobs);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transporter Jobs'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: JobSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: displayedJobs.length,
        itemBuilder: (context, index) {
          transporters_jobs job = displayedJobs[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransporterDetailScreen(job),
                ),
              );
            },
            child: Container(
              width: 200.0, // Adjust the width as needed
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(' ${job.timeRide}',
                                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(' RM${job.fee}', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            height: 2.0,
                            color: Colors.grey, // Line color
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.circle_outlined, size: 16.0, color: Colors.blue),
                          SizedBox(width: 4.0),
                          Text('${job.locationStart}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, size: 16.0, color: Colors.red),
                          SizedBox(width: 4.0),
                          Text('${job.locationEnd}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),),
          );
        },
      ),
    );
  }
}

class JobSearchDelegate extends SearchDelegate<String> {
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
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement the logic to filter jobs based on the search query
    List<transporters_jobs> searchResults = openTranspoterJobs
        .where((job) =>
    job.timeRide.toLowerCase().contains(query.toLowerCase()) ||
        job.locationStart.toLowerCase().contains(query.toLowerCase()) ||
        job.locationEnd.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        transporters_jobs job = searchResults[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(job.timeRide),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${job.locationStart} to ${job.locationEnd}'),
                Text('RM${job.fee}' as String),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called when the user types something in the search bar,
    // but we are using the same logic for both suggestions and results in this example.
    return buildResults(context);
  }
}