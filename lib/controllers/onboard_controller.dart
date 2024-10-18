import 'package:foody_voody/Screens/homescreen.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  final RxBool lastPage = false.obs; // Observable for lastPage

  // Method to handle page change logic
  void onPageChanged(int page) {
    lastPage.value = (page == 2);
    if (page == 2) {
      _navigateToNext();
    }
  }

  Future<void> _navigateToNext() async {
    // Delay the navigation for 3 seconds
    await Future.delayed(const Duration(milliseconds: 800));
    // Navigate to the HomePage after the delay
    Get.back();
    Get.to(() => const HomeScreen(), transition: Transition.cupertinoDialog);
  }
  // Method for navigation to the home screen
  // void navigateToHome() {
  //   Get.to(() => HomeScreen(), transition: Transition.circularReveal);
  // }
}
