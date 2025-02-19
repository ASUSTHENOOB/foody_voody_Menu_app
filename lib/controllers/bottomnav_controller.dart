import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt currentIndex = 0.obs; // Observable integer

  void changeIndex(int index) {
    currentIndex.value = index; // Update the selected index
  }
}
