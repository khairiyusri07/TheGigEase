import 'package:flutter/material.dart';

class profileEmpty extends StatelessWidget {
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
