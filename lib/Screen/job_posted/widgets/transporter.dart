import 'package:flutter/material.dart';

import 'transporter/tActive.dart';
import 'transporter/tCanceled.dart';
import 'transporter/tComplete.dart';

class TransporterJobs extends StatefulWidget {
  @override
  _TransporterJobsState createState() => _TransporterJobsState();
}

class _TransporterJobsState extends State<TransporterJobs> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Container(height: 25.0, color: Theme.of(context).colorScheme.primary),
          CategorySelector(
            onTap: (index) {
              setState(() {
                currentIndex = index;
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              });
            },
            currentIndex: currentIndex,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                tActiveJob(),
                tCompletedJob(),
                tCanceledJob(),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySelector extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  CategorySelector({required this.onTap, required this.currentIndex});

  @override
  _CategorySelector createState() => _CategorySelector();
}

class _CategorySelector extends State<CategorySelector> {
  List<String> categories = ['Active jobs', 'Completed jobs', 'Canceled Jobs'];
  List<String> screenTitles = ['Active jobs', 'Completed jobs', 'Canceled Jobs'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((String category) {
            int index = categories.indexOf(category);
            return GestureDetector(
              onTap: () {
                widget.onTap(index);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.0,
                  vertical: 0.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: index == widget.currentIndex
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      screenTitles[index],
                      style: TextStyle(
                        color: index == widget.currentIndex ? Colors.black : Colors.blueGrey,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
