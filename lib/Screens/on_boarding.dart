import 'package:flutter/material.dart';
import 'package:foody_voody/Models/on_boardingModel.dart';
import 'package:foody_voody/controllers/onboard_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  final OnboardController onboardController =
      Get.put(OnboardController()); // Initialize controller

  @override
  Widget build(BuildContext context) {
    print("REbuilting...");
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              onPageChanged:
                  onboardController.onPageChanged, // Use controller method
              controller: _controller,
              children: onboarding.map((model) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(10, 10),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          model.Image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      endIndent: 50,
                      indent: 50,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      model.title,
                      style: GoogleFonts.pompiere(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      model.subtitle,
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(49.0),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: onboarding.length,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Color.fromARGB(255, 255, 6, 122),
                        dotWidth: 12,
                        dotHeight: 12,
                        dotColor: Color.fromARGB(255, 1, 159, 174),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Obx(() => onboardController
            //         .lastPage.value // Use Obx to reactively update UI
            //     ? Positioned(
            //         bottom: 45,
            //         right: 50,
            //         child: InkWell(
            //           onTap: onboardController
            //               .navigateToHome, // Call controller method
            //           child: Container(
            //             padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            //             decoration: BoxDecoration(
            //               boxShadow: const [
            //                 BoxShadow(
            //                   color: Color.fromARGB(255, 130, 128, 128),
            //                   offset: Offset(0.0, 7.0),
            //                   blurRadius: 6.0,
            //                 ),
            //               ],
            //               color: Color.fromARGB(255, 255, 6, 122),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Row(
            //               children: [
            //                 Text(
            //                   "Done",
            //                   style: GoogleFonts.akayaKanadaka(
            //                     textStyle: const TextStyle(
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 16,
            //                     ),
            //                   ),
            //                 ),
            //                 const Icon(color: Colors.white, Icons.arrow_right),
            //               ],
            //             ),
            //           ),
            //         ),
            //       )
            //     : Container()),
          ],
        ),
      ),
    );
  }
}
