import 'package:flutter/material.dart';

import 'set_preference.dart';

class GigDateSelector extends StatefulWidget {
  final String jobTitle;
  final String jobDiscription;
  final double jobPayment;
  const GigDateSelector({Key? key, required this.jobTitle, required this.jobDiscription, required this.jobPayment});

  @override
  State<GigDateSelector> createState() => _GigDateSelectorState();
}

class _GigDateSelectorState extends State<GigDateSelector> {
  DateTimeRange? _selectedDateRange;
  List<DateTime> _selectedDates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select the date for the job",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(height: 300,),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                // Show date range picker
                DateTimeRange? picked = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );

                if (picked != null && picked.start != null && picked.end != null) {
                  setState(() {
                    _selectedDateRange = picked;
                    _selectedDates = _getDatesBetween(picked.start, picked.end);
                  });
                }
              },
              child: Text("Select Date Range"),
            ),
          ),
          if (_selectedDateRange != null)
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "Start Dates: \n${_selectedDateRange!.start.toLocal()} \nEnd Dates: \n${_selectedDateRange!.end.toLocal()}",
                style: TextStyle(fontSize: 16),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Number of Dates Picked: ${_selectedDates.length}",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SetPreferences(
                        jobTitle: widget.jobTitle,
                        jobDiscription: widget.jobDiscription,
                          jobPayment: widget.jobPayment,
                      ),
                  ),
                );
              },
              child: Text("Continue"),
            ),
          ),
        ],
      ),
    );
  }

  List<DateTime> _getDatesBetween(DateTime start, DateTime end) {
    List<DateTime> dates = [];
    for (int i = 0; i <= end.difference(start).inDays; i++) {
      dates.add(start.add(Duration(days: i)));
    }
    return dates;
  }
}
