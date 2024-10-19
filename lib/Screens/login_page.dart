import 'package:flutter/material.dart';
import 'package:foody_voody/Screens/main_content.dart';
import 'package:foody_voody/components/button.dart';
import 'package:foody_voody/components/textfield.dart';
import 'package:foody_voody/controllers/animated_button_controller.dart';
import 'package:foody_voody/utilis/appbar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final ButtonController buttonController = Get.put(ButtonController());

  Future<void> _login() async {
    if (emailController.text.isEmpty || passController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("All fields are required!"),
          duration: Duration(seconds: 1),
          backgroundColor: Color.fromARGB(255, 255, 0, 0),
        ),
      );
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true); // Set login state to true
      Get.off(() => Homenav()); // Navigate to MainPage
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Successfully logged in!"),
          backgroundColor: Color.fromARGB(139, 5, 255, 155),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        buttonController.resetButtons();
      },
      child: Scaffold(
        appBar: MyAppbar(title: "L O G I N"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            Positioned(
              child: Column(
                children: [
                  Image.asset(
                    'images/log1.png',
                    height: 200,
                    width: 300,
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Good to see you again! Let's get you logged in",
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 1, 159, 174),
                      Color.fromARGB(255, 255, 6, 122),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextField2(
                        myIcon: Icons.email,
                        hintName: "Enter Email",
                        controller: emailController,
                        obsecuretext: false,
                        labelName: 'Email',
                      ),
                      const SizedBox(height: 5),
                      MyTextField2(
                        myIcon: Icons.password,
                        hintName: "Enter Password",
                        controller: passController,
                        obsecuretext: true,
                        labelName: 'Password',
                      ),
                      const SizedBox(height: 20),
                      Mybutton(
                        text: "L O G I N",
                        ontap: _login, // Call login function
                        icon: Icons.login,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
