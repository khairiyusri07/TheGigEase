import 'package:flutter/material.dart';

import 'components/app_bar.dart';
import 'widgets/book_work.dart';
import 'widgets/gigs_upcoming_work.dart';
import 'widgets/history.dart';
import 'widgets/saved_work.dart';

class JobAppliedScreen extends StatefulWidget {
  @override
  _JobAppliedScreenState createState() => _JobAppliedScreenState();
}

class _JobAppliedScreenState extends State<JobAppliedScreen> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JobAppliedAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(height: 1.0, color: Theme.of(context).colorScheme.primary),
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
                UpcomingWork(),
                BookWork(),
                SavedWork(),
                history(),
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
  List<String> categories = ['Upcoming Work', 'Applied Works', 'Saved Works', 'History'];
  List<String> screenTitles = ['Upcoming work', 'Applied works', 'Saved works', 'History'];

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
