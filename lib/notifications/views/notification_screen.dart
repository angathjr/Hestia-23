import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hestia_23/core/Constants..dart';
import 'package:hestia_23/core/widgets/back_button_widget.dart';
import 'package:hestia_23/notifications/controllers/notification_controller.dart';
import 'package:hestia_23/notifications/views/general_notifications.dart';
import 'package:hestia_23/profile/controllers/profile_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationController notificationController = Get.find();
  final ProfileController profileController = Get.find();

  final style1 = const TextStyle(
    fontWeight: FontWeight.bold,
  );
  final style2 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                const BackButtonWidget(),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'NOTIFICATIONS',
                  style: FutTheme.categoryFont,
                ),
              ],
            ),

            //tab bar is placed here

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(h * 0.09),
              child: TabBar(
                isScrollable: false,
                labelColor: Colors.white,
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.grey,
                indicatorColor: const Color.fromARGB(255, 226, 222, 169),
                dividerColor: Colors.transparent,
                padding: EdgeInsets.only(right: width * 0.3),
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'General',
                          style: FutTheme.font3,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 20,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 236, 217, 15)),
                          child: const Center(
                              child: Text(
                            '${4}',
                            style: TextStyle(color: Colors.black),
                          )),
                        )
                      ],
                    ),
                  ),
                  Tab(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'My Events',
                        style: FutTheme.font3,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 20,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 236, 217, 15)),
                        child: const Center(
                            child: Text(
                          '${4}',
                          style: TextStyle(color: Colors.black),
                        )),
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.04, width * 0.04, width * 0.04, 0),
            child: TabBarView(
              children: [
                //tab bar view for general events
                GeneralNotificationsScreen(),

                ListView.builder(
                  itemCount: profileController.regEvents.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => notificationController
                          .goToNotification(profileController.regEvents[index]),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 33, 32, 32)),
                        height: h * 0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                'WORKSHOP ABOUT TO START',
                                style: GoogleFonts.questrial(textStyle: style2),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: RichText(
                                text: const TextSpan(
                                  text:
                                      "All registered people head to college ground DJ Rizz proshow will start by 2:00 pm...",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' Read more',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 236, 217, 15))),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '12:34',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 70, 67, 67),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                10.0)), // Set rounded corner radius
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10,
                                              color: Colors.black,
                                              offset: Offset(1, 3))
                                        ] // Make rounded corner of border
                                        ),
                                    child: Text(
                                      "${profileController.regEvents[index].title}",
                                      style: GoogleFonts.questrial(
                                          textStyle: const TextStyle(
                                              color: Colors.white)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
