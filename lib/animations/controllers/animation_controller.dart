import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AnimController extends GetxController {
  var start = true.obs;



  void loadScheduleAnimation() async {
    await Future.delayed(const Duration(milliseconds: 600), () {
      start.value = false;
    });
  }
}
