import 'package:flutter/material.dart';


// ignore: camel_case_types
class JobScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const JobScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Job Posted",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0.0,
      automaticallyImplyLeading: false,

    );

  }

  @override
  Size get preferredSize => const Size.fromHeight(30);
}
