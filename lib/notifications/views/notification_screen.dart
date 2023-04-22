import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/core/Constants..dart';
import 'package:hestia_23/core/widgets/back_button_widget.dart';
import 'package:hestia_23/notifications/controllers/notification_controller.dart';
import 'package:hestia_23/notifications/views/general_notifications.dart';
import 'package:hestia_23/notifications/views/registered_events_notification.dart';
import 'package:hestia_23/profile/controllers/profile_controller.dart';

import '../../core/Constants..dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationController notificationController = Get.find();
  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: DefaultTabController(
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
                      padding: EdgeInsets.only(right: width * 0.2),
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
                              Obx(
                                () => Container(
                                  width: 20,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 236, 217, 15)),
                                  child: Center(
                                      child: Text(
                                    '${notificationController.generalNotifications.length}',
                                    style: const TextStyle(color: Colors.black),
                                  )),
                                ),
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
                            Obx(
                              () => Container(
                                width: 20,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 236, 217, 15)),
                                child: Center(
                                    child: Text(
                                  '${profileController.regEvents.length}',
                                  style: const TextStyle(color: Colors.black),
                                )),
                              ),
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
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //tab bar view for general events
                      GeneralNotificationsScreen(),
                      RegisteredEventsNotificatonScreen(),
                    ],
                  ),
                ))),
      ),
    );
  }
}
