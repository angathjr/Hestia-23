import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/Constants..dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/notification_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GeneralNotificationsScreen extends StatelessWidget {
  GeneralNotificationsScreen({super.key});

  final NotificationController notificationController = Get.find();
  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    double width = MediaQuery.of(context).size.width;
    double cardHeight = h * 0.2;

    return AnimationLimiter(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 2500),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.01),
                  child: Container(
                    // height: cardHeight,
                    decoration: BoxDecoration(
                      color: FutTheme.primaryBg,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: cardHeight * 0.1,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Pro show about to begin".toUpperCase(),
                                style: FutTheme.font5.copyWith(
                                    fontSize: h * 0.02, color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: cardHeight * 0.1,
                            ),
                            Text(
                              "All registerd participants are requested to assemble at college auditohhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhrium",
                              maxLines: 2,
                              style: FutTheme.font2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "9.30 PM",
                                  style: FutTheme.font6
                                      .copyWith(fontSize: width * 0.03),
                                ),
                                Container(
                                  padding: EdgeInsets.all(width * 0.02),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      vertical: cardHeight * 0.06),
                                  width: width * 0.4,
                                  height: cardHeight * 0.3,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "PRO SHOW",
                                    style: FutTheme.font5.copyWith(
                                        color: FutTheme.secondaryColor,
                                        overflow: TextOverflow.clip),
                                  ),
                                )
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
