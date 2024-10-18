// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foody_voody/utilis/appbar.dart';

class Profilenav extends StatelessWidget {
  const Profilenav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "P R O F I L E"),
      body: Center(
        child: Text("P R O F I L E"),
      ),
    );
  }
}
