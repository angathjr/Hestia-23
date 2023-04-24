import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/Schedule/views/schedule.dart';
import 'package:hestia_23/fcm/controllers/fcm_controller.dart';
import 'package:hestia_23/home/views/home_screen.dart';
import 'package:hestia_23/home/views/leaderboard_card.dart';
import 'package:hestia_23/profile/views/profile_screen.dart';
import 'package:upgrader/upgrader.dart';

import '../controllers/navbar_controller.dart';

class NavBarPage extends StatelessWidget {
  NavBarPage({Key? key}) : super(key: key);

  final NavBarController navBarController = Get.find();
  final FCMController fcmController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double navHeight = height * 0.063;

    return WillPopScope(
      onWillPop: () async => false,
      child: UpgradeAlert(
        upgrader: Upgrader(
          durationUntilAlertAgain: Duration.zero,
          canDismissDialog: false,
          shouldPopScope: () => false,
          showIgnore: false,
          showLater: false,
        ),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: [
                  //pageview

                  SizedBox(
                    width: width,
                    height: height,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: navBarController.controller,
                      children: [
                        HomeScreen(),
                        Schedule(),
                        LeaderBoard(),
                        ProfileScreen()
                      ],
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.06, vertical: height * 0.008),
                        child: Container(
                          height: height * 0.065,
                          decoration: BoxDecoration(
                            color: const Color(0xff111111),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildNavIcons(
                                navHeight: navHeight,
                                index: 0,
                                icon: const Icon(FeatherIcons.home),
                                width: width,
                                color: context.theme.primaryColor,
                              ),
                              buildNavIcons(
                                  navHeight: navHeight,
                                  index: 1,
                                  icon: const Icon(FeatherIcons.calendar),
                                  width: width,
                                  color: context.theme.primaryColor),
                              buildNavIcons(
                                  navHeight: navHeight,
                                  index: 2,
                                  icon: const Icon(
                                    Icons.leaderboard_outlined,
                                  ),
                                  width: width,
                                  color: context.theme.primaryColor),
                              buildNavIcons(
                                  navHeight: navHeight,
                                  index: 3,
                                  icon: const Icon(FeatherIcons.user),
                                  width: width,
                                  color: context.theme.primaryColor)
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget buildNavIcons(
      {required double navHeight,
      required double width,
      required Icon icon,
      required Color color,
      required int index}) {
    return SizedBox(
        width: navHeight,
        height: navHeight,
        child: Obx(
          () => IconButton(
            icon: Stack(
              children: [
                Center(child: icon),
                if (index == navBarController.index.value)
                  Center(
                    child: Container(
                      width: width * 0.025,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: color,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () {
              navBarController.changePage(index, navBarController.controller);
              navBarController.index.value = index;
            },
            color: Colors.grey.shade400,
            enableFeedback: true,
            splashRadius: 5,
            disabledColor: Colors.red,
          ),
        ));
  }
}

//TODO: this is only a sample nav bar for testing, need to rebuild it ,also need to change the icons and ripple effects
