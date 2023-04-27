import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/auth/controllers/auth_controller.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            SizedBox(
              height: screenHeight * 1.2,
              width: screenWidth * 1.3,
              child: Image.asset("assets/images/loginfinal.png"),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!controller.isReview.value || Platform.isAndroid)
                    Obx(
                      () => Container(
                        decoration: const BoxDecoration(
                            color: Color(0xff121212),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        height: 70,
                        width: 280,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: RoundedButton(
                            lottie: 'google',
                            text: controller.text1.value,
                            press: () async {
                              controller.googleSignIn();
                            },
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (controller.isReview.value && !Platform.isAndroid)
                    Obx(
                      () => Container(
                        decoration: const BoxDecoration(
                            color: Color(0xff121212),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        height: 70,
                        width: 280,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: RoundedButton(
                            lottie: 'apple',
                            text: controller.text2.value,
                            press: () async {
                              controller.appleSignIn();
                            },
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//rounded button

class RoundedButton extends StatelessWidget {
  final String text;
  final String lottie;
  final Color? color, textColor;
  final void Function() press;
  const RoundedButton({
    Key? key,
    required this.text,
    this.textColor = Colors.white,
    this.color,
    required this.press,
    required this.lottie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Lottie.asset(
              'assets/lottie/$lottie.json',
              width: 65,
              height: 80,
            ),
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Helvetica',
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
