import 'package:flutter/material.dart';
import 'package:foody_voody/Screens/NAVS/Homenav.dart';
import 'package:foody_voody/Screens/on_boarding.dart';
import 'package:foody_voody/Screens/homescreen.dart'; // Import HomeScreen
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginState(); // Check login state during initialization
  }

  Future<void> _checkLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false; // Default is false

    // Delay the navigation for 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    // Navigate based on login status
    if (isLoggedIn) {
      Get.off(() => const Homenav()); // Navigate to HomeScreen if logged in
    } else {
      Get.off(() => const OnBoarding()); // Otherwise, navigate to OnBoarding
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 1, 159, 174),
            Color.fromARGB(255, 255, 6, 122)
          ], begin: Alignment.topRight, end: Alignment.bottomRight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'images/icon.png',
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Foody Voody".toUpperCase(),
              style: GoogleFonts.pompiere(
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 159, 174),
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
