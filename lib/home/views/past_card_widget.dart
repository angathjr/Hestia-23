import 'package:flutter/material.dart';
import 'package:hestia_23/core/Constants..dart';

class PastCardWidget extends StatelessWidget {
  const PastCardWidget({super.key});

  // Image.asset(
  //             ,
  //             width: MediaQuery.of(context).size.width * 1,
  //           ),

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final cardHeight = h * 0.46;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        // height: h * 0.7,
        width: w * 0.95,
        decoration: const BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage('assets/images/past_card.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
            ),
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/hestia23.appspot.com/o/HomeScreenImages%2Fproshow.jpg?alt=media&token=0d63e9b7-8ce1-4b9b-bf2d-680b1aea4122',
              height: 230,
              width: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'PRO SHOW',
              style:
                  FutTheme.categoryFont.copyWith(fontSize: cardHeight * 0.067),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: w * 0.7,
              child: Text(
                'Learn from the finest of skills from the best of mentors at our curated workshops and skill sessions',
                style: FutTheme.font7.copyWith(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: w * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
