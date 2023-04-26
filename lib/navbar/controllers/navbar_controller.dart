import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/animations/controllers/animation_controller.dart';

class NavBarController extends GetxController {
  var index = 0.obs;
  PageController controller = PageController(initialPage: 0, keepPage: false);

  final AnimController anim = Get.find();

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        Get.snackbar(
            "Network Error", "Please check your internet connectivity");
      }
    });
  }

  void changePage(int index, PageController controller) {
    controller.jumpToPage(index);
    anim.start(true);
    if (index == 1) anim.loadScheduleAnimation();
  }
}
