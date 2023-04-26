import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void loadPages() async {
    await Future.delayed(const Duration(milliseconds: 2600));
    Get.offAllNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    loadPages();
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset("assets/images/splash.gif"));
  }
}
