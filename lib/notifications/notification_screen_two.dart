import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/widgets/back_button_widget.dart';

class NotificationScreenTwo extends StatelessWidget {
  const NotificationScreenTwo({super.key});

  final style1 =
      const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);

  final style2 = const TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(onTap: () => null, child: const BackButtonWidget()),
        ),
        centerTitle: true,
        title: Text(
          'AI WORKSHOP',
          style: GoogleFonts.questrial(textStyle: style1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 33, 32, 32)),
              height: h * 0.23,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Registration has begun',
                      style: GoogleFonts.questrial(textStyle: style1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: RichText(
                      text: TextSpan(
                        text:
                            "All registered people head to college ground DJ Rizz proshow will start by 2:00 pm...",
                        style: GoogleFonts.questrial(textStyle: style2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '12:34',
                          style: GoogleFonts.questrial(textStyle: style1),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
