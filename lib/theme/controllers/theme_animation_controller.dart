import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  var isVisible = false.obs;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.normal,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 300),
    );

    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
