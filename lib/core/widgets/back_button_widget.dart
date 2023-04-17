import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}
