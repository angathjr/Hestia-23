import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/animations/controllers/animation_controller.dart';
import 'package:hestia_23/events/controllers/events_search_controller.dart';

class NavBarController extends GetxController {
  var index = 0.obs;
  final PageController controller =
      PageController(initialPage: 0, keepPage: false);
  final EventsSearchController searchController = Get.find();
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
    searchController.clearController();
  }
}
