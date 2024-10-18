// lib/views/home_screen.dart
import 'package:flutter/material.dart';
import 'package:foody_voody/Screens/login_page.dart';
import 'package:foody_voody/Screens/signup_page.dart';
import 'package:foody_voody/components/animated_button.dart';
import 'package:foody_voody/controllers/animated_button_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ButtonController buttonController = Get.put(ButtonController());

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 120.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/icon.png",
                  height: 300,
                  width: 300,
                ),
                SizedBox(
                  height: 10,
                ),
                AnimatedButton(
                  icon: Icons.login,
                  ontap: () {
                    buttonController.toggleLoginButton();
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      Get.to(
                        () => const LoginPage(),
                        transition: Transition.fadeIn,
                      ); // Navigate to Login Page
                    });
                  },
                  text: "L O G I N",
                  isPressed: buttonController.isLoginButtonPressed,
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedButton(
                  icon: Icons.app_registration_sharp,
                  ontap: () {
                    buttonController.toggleSignupButton();
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      Get.to(
                        () => const SignupPage(),
                        transition: Transition.fadeIn,
                      ); // Navigate to Login Page
                    }); // Navigate to Signup Page
                  },
                  text: "S i g n u p".toUpperCase(),
                  isPressed: buttonController.isSignupButtonPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
