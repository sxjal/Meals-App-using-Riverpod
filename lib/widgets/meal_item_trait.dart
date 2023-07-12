import 'package:flutter/material.dart';

class Trait extends StatelessWidget {
  const Trait({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 20,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
