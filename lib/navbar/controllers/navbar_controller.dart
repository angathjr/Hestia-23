import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/animations/controllers/animation_controller.dart';

class NavBarController extends GetxController {
  var index = 0.obs;
  PageController controller = PageController(initialPage: 0, keepPage: false);

  final AnimController anim = Get.find();

  void changePage(int index, PageController controller) {
    controller.jumpToPage(index);
    anim.start(true);
    if (index == 1) anim.loadScheduleAnimation();
  }
}
