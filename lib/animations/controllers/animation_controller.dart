import 'package:get/get.dart';

class AnimController extends GetxController {
  var start = true.obs;

  void loadScheduleAnimation() async {
    await Future.delayed(const Duration(milliseconds: 300), () {
      start.value = false;
    });
  }
}
