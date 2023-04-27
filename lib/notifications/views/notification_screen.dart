import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/core/constants..dart';
import 'package:hestia_23/notifications/controllers/notification_controller.dart';
import 'package:hestia_23/notifications/views/general_notifications.dart';
import 'package:hestia_23/notifications/views/registered_events_notification.dart';
import 'package:hestia_23/profile/controllers/profile_controller.dart';

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

    return WillPopScope(
      onWillPop: () async {
        notificationController.seeNotifications();
        return true;
      },
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            notificationController.seeNotifications();
                            Get.back();
                          },
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
                                size: h * 0.022,
                              )),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'NOTIFICATIONS',
                          style: context.theme.textTheme.titleLarge,
                        ),
                      ],
                    ),

                    //tab bar is placed here

                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(h * 0.09),
                      child: TabBar(
                        onTap: (index) {
                          if (index == 1) {
                            notificationController.seeNotifications();
                          }
                        },
                        isScrollable: false,
                        labelColor: Colors.white,
                        indicatorWeight: 2,
                        indicatorSize: TabBarIndicatorSize.label,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor:
                        const Color.fromARGB(255, 226, 222, 169),
                        dividerColor: Colors.transparent,
                        padding: EdgeInsets.only(right: width * 0.2),
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'General',
                                  style: FutTheme.font3,
                                ),
                                Obx(() => notificationController
                                    .unseenGeneralNotificationCount
                                    .value !=
                                    0
                                    ? const SizedBox(
                                  width: 10,
                                )
                                    : const SizedBox()),
                                Obx(
                                      () => notificationController
                                      .unseenGeneralNotificationCount
                                      .value !=
                                      0
                                      ? Container(
                                    width: 20,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(
                                            255, 236, 217, 15)),
                                    child: Center(
                                        child: Text(
                                          '${notificationController.unseenGeneralNotificationCount.value}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        )),
                                  )
                                      : const SizedBox(),
                                )
                              ],
                            ),
                          ),
                          Tab(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'My Events',
                                    style: FutTheme.font3,
                                  ),
                                  Obx(() => notificationController
                                      .unseenMyEventsNotificationCount
                                      .value !=
                                      0
                                      ? const SizedBox(
                                    width: 10,
                                  )
                                      : const SizedBox()),
                                  Obx(
                                        () => notificationController
                                        .unseenMyEventsNotificationCount
                                        .value !=
                                        0
                                        ? Container(
                                      width: 20,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromARGB(
                                              255, 236, 217, 15)),
                                      child: Center(
                                          child: Text(
                                            '${notificationController.unseenMyEventsNotificationCount.value}',
                                            style: const TextStyle(
                                                color: Colors.black),
                                          )),
                                    )
                                        : const SizedBox(),
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
                        GeneralNotificationsScreen(),
                        RegisteredEventsNotificatonScreen(),
                      ],
                    ),
                  ))),
        ),
      ),
    );
  }
}
