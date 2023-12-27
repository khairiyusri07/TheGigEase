import 'package:flutter/material.dart';

class add_button extends StatelessWidget {
  final VoidCallback onPressed;

  const add_button({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape: const CircleBorder(),
      child: const Icon(Icons.add),
    );
  }
}
