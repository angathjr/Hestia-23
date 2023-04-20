import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
          width: width * 0.09,
          height: width * 0.09,
          decoration: const BoxDecoration(
            color: Color(0xff202020),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: height * 0.022,
          )),
    );
  }
}
