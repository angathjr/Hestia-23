import 'package:get/get.dart';

class ThemeController extends GetxController {
  var selectedIndex = 1.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
