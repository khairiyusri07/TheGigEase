import 'package:flutter/material.dart';


// ignore: camel_case_types
class ProfileScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Profile",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      actions: <Widget>[

      ],
    );

  }

  @override
  Size get preferredSize => const Size.fromHeight(30);
}
