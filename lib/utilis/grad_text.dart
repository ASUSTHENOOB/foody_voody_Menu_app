// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyGradText extends StatelessWidget {
  final String title;
  const MyGradText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Color.fromARGB(255, 1, 159, 174),
          Color.fromARGB(255, 255, 6, 122),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.topCenter,
      ).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white, // This doesn't matter, shader overrides it
        ),
      ),
    );
  }
}
