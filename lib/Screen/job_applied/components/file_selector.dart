// import 'package:flutter/material.dart';
//
// class CategorySelector extends StatefulWidget {
//   @override
//   _CategorySelector createState() => _CategorySelector();
// }
//
// class _CategorySelector extends State<CategorySelector> {
//   int selectedIndex = 0;
//   final List<String> categories = ['Upcoming Work', 'Booked Works', 'Saved Works', 'History'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//         border: Border.all(
//           color: Theme.of(context).colorScheme.primary,
//         )
//         ),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: categories.map((String category) {
//             int index = categories.indexOf(category);
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedIndex = index;
//                 });
//               },
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 00,
//                   vertical: 0.0,
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(
//                         color: index == selectedIndex ? Theme.of(context).colorScheme.primary : Colors.transparent,
//                         width: 4.0,
//                       ),
//                     ),
//                   ),
//                   padding: EdgeInsets.all(10.0),
//                   child: Center(
//                     child: Text(
//                       category,
//                       style: TextStyle(
//                         color: index == selectedIndex ? Colors.black : Colors.blueGrey,
//                         fontSize: 12.0,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
