import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hestia_23/core/widgets/back_button_widget.dart';
import 'package:hestia_23/notifications/controllers/notification_controller.dart';
import 'package:intl/intl.dart';

class NotificationScreenTwo extends StatelessWidget {
  NotificationScreenTwo({super.key});

  final NotificationController notificationController = Get.find();

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
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: BackButtonWidget(),
        ),
        centerTitle: true,
        title: Text(
          notificationController.selectedNotEvent.title ?? '',
          style: GoogleFonts.questrial(textStyle: style1),
        ),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: notificationController.notifications.length,
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
                              '${notificationController.notifications.value[index].message}',
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
                            DateFormat('h:mm a').format(notificationController
                                    .notifications[index].createdAt ??
                                DateTime.now()),
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
      ),
    );
  }
}
