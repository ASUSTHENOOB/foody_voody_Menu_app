import 'package:flutter/material.dart';
import 'package:foody_voody/Screens/Splash_Screen.dart';
import 'package:foody_voody/Screens/main_content.dart';
import 'package:foody_voody/themes/light_theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foody Voody',
      home: SplashScreen(),
      theme: lightTheme,
    );
  }
}
