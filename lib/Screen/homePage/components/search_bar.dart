import 'package:flutter/material.dart';

class SearchBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity, // Use full width
            height: 65,
            child: Stack(
              children: [
                Container(
                  width: double.infinity, // Use full width
                  height: 35,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,

                  ),
                ),
                Positioned(
                  left: 16, // Adjust left offset as needed
                  top: 7, // Adjust top offset as needed
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32, // Adjust the width as needed
                    height: 52, // Adjust the height as needed
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 60,
                          margin: const EdgeInsets.only(top: 5.1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                                hintText: "Search for jobs...",
                                prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 30),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
