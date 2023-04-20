import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AnimController extends GetxController {
  var start = true.obs;

  void loadAnimation() async {
    await Future.delayed(const Duration(milliseconds: 200), () {
      start.value = false;
    });
  }
}
