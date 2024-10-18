// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foody_voody/utilis/appbar.dart';

class Menunav extends StatelessWidget {
  const Menunav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "O U R   M E N U S"),
      body: Center(
        child: Text("M E N U"),
      ),
    );
  }
}
