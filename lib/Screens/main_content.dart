// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:foody_voody/Screens/NAVS/Homenav.dart';
import 'package:foody_voody/Screens/NAVS/Menunav.dart';
import 'package:foody_voody/Screens/NAVS/Profilenav.dart';
import 'package:foody_voody/controllers/bottomnav_controller.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Import the curved navigation bar package

class MainPage extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> _pages = [
    const Homenav(),
    const Menunav(),
    const Profilenav(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
          () => _pages[controller.currentIndex.value]), // Observe index changes
      bottomNavigationBar: Obx(() => CurvedNavigationBar(
            index: controller.currentIndex.value, // Set the current index
            height: 50.0, // Height of the navigation bar
            items: <Widget>[
              Icon(
                  color: controller.currentIndex.value == 0
                      // ignore: prefer_const_constructors
                      ? Color.fromARGB(255, 1, 159, 174)
                      : Colors.grey,
                  Icons.home,
                  size: 30), // Icon for Home
              Icon(
                  color: controller.currentIndex.value == 1
                      ? const Color.fromARGB(255, 1, 159, 174)
                      : Colors.grey,
                  Icons.menu_book,
                  size: 30), // Icon for Menu
              Icon(
                  color: controller.currentIndex.value == 2
                      ? const Color.fromARGB(255, 1, 159, 174)
                      : Colors.grey,
                  Icons.person,
                  size: 30), // Icon for Profile
            ],
            color: Colors.grey.shade300, // Background color of the icons
            buttonBackgroundColor:
                Colors.grey.shade300, // Background color of the active icon
            backgroundColor: const Color.fromARGB(
                255, 1, 159, 174), // Background color of the bar
            animationCurve:
                Curves.easeInOut, // Animation curve for the transition
            animationDuration:
                const Duration(milliseconds: 400), // Duration of the animation
            onTap: (index) {
              controller.changeIndex(index); // Update the current index
            },
          )),
          
    );
  }
}
