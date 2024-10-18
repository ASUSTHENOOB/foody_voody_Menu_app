import 'package:flutter/material.dart';
import 'package:foody_voody/Screens/login_page.dart';
import 'package:foody_voody/components/button.dart';
import 'package:foody_voody/components/textfield.dart';
import 'package:foody_voody/controllers/animated_button_controller.dart';
import 'package:foody_voody/utilis/appbar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final ButtonController buttonController = Get.put(ButtonController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        buttonController.resetButtons();
      },
      child: Scaffold(
        appBar: MyAppbar(title: "S I G N U P"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            Positioned(
              child: Column(
                children: [
                  Image.asset(
                    'images/sing1.png',
                    height: 200,
                    width: 300,
                  ),
                  const Align(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Sign up for tasty meals and exclusive Deals!",
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
                        myIcon: Icons.abc_outlined,
                        hintName: "Enter Username",
                        controller: nameController,
                        obsecuretext: false,
                        labelName: 'Name',
                      ),
                      const SizedBox(height: 5),
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
                      const SizedBox(height: 5),
                      MyTextField2(
                        myIcon: Icons.password_sharp,
                        hintName: "Confirm Password",
                        controller: confirmPassController,
                        obsecuretext: true,
                        labelName: 'Confirm Password',
                      ),
                      const SizedBox(height: 20),
                      Mybutton(
                        text: "S I G N U P",
                        ontap: () {
                          // Check if any field is empty
                          if (nameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              passController.text.isEmpty ||
                              confirmPassController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("All fields are required!"),
                                duration: Duration(seconds: 1),
                                backgroundColor: Color.fromARGB(255, 255, 0, 0),
                              ),
                            );
                          }
                          // Check if passwords do not match
                          else if (passController.text !=
                              confirmPassController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Passwords do not match!"),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 1),
                              ),
                            );
                          } else {
                            Get.to(const LoginPage());
                            // Proceed with the signup logic here
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Successfully!"),
                              backgroundColor: Color.fromARGB(255, 0, 255, 0),
                              duration: Duration(seconds: 1),
                            ));
                          }
                        },
                        icon: Icons.app_registration_outlined,
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
