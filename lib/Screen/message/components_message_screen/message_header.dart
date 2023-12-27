import 'package:flutter/material.dart';


// ignore: camel_case_types
class messageHeader extends StatelessWidget implements PreferredSizeWidget {
  const messageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Message",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white, size: 30,),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(30);
}
