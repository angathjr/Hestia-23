import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/auth/controllers/auth_controller.dart';
import 'package:hestia_23/core/Constants..dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import 'package:hestia_23/home/views/event_category_card_present.dart';
import 'package:hestia_23/notifications/controllers/notification_controller.dart';
import 'package:hestia_23/profile/controllers/profile_controller.dart';
import 'package:hestia_23/stories/views/stories_widget.dart';
import 'package:hestia_23/events/views/events_screen.dart';
import 'package:hestia_23/theme/controllers/theme_animation_controller.dart';
import 'package:hestia_23/theme/views/switch_theme_screen.dart';
import 'event_category_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final EventsController eventController = Get.find();
  final AuthController authController = Get.find();
  final ProfileController profController = Get.find();
  final ThemeAnimationController themeController =
      Get.put(ThemeAnimationController());
  final NotificationController notificationController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: false,
              primary: true,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        useSafeArea: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        isDismissible: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        transitionAnimationController:
                            themeController.animationController,
                        builder: (context) => BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: SwitchThemeScreen()),
                      );
                    },
                    child: Image.asset(
                      "assets/images/mascot.png",
                      scale: 2.2,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "hi ${profController.user.value.name?.split(' ').first}",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: width * 0.035)),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        width: width * 0.5,
                        child: Text("Welcome to the Timeless Odyssey",
                            overflow: TextOverflow.clip,
                            style: context.theme.textTheme.titleLarge
                                ?.copyWith(fontSize: width * 0.022)),
                      ),
                    ],
                  )
                ],
              ),
              actions: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      color: FutTheme.primaryBg.withOpacity(0.7)),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.toNamed('search'),
                        //  Navigator.push(
                        //     context, SizeTransition5(EventsSearchScreen())),
                        icon: const Icon(FeatherIcons.search),
                      ),
                      IconButton(
                        onPressed: () => Get.toNamed('notification-1'),
                        icon: Obx(
                          () => Stack(
                            children: [
                              if (notificationController
                                      .generalNotifications.isNotEmpty ||
                                  profController.regEvents.isNotEmpty)
                                Positioned(
                                  right: 4,
                                  top: 7,
                                  child: Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: context.theme.primaryColor,
                                    ),
                                  ),
                                ),
                              const Center(
                                child: Icon(
                                  FeatherIcons.bell,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: height,
                    width: width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/bg.png",
                            ))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        SizedBox(
                          width: width,
                          child: Stories(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.04, bottom: height * 0.03),
                          child: Container(
                            alignment: Alignment.center,
                            // width: width,
                            // height: height * 0.08,
                            child: Text("EXPLORE EVENTS",
                                style: context.theme.textTheme.titleLarge
                                    ?.copyWith(fontSize: width * 0.075)),
                          ),
                        ),

                        //the category screen placed here

                        SizedBox(
                          height: height * 0.5,
                          width: width,
                          child: CarouselSlider.builder(
                            itemCount: eventController.categories.length,
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              return GestureDetector(
                                  onTap: () {
                                    eventController.selectedCategory =
                                        eventController.categories[index];
                                    eventController.fetchEvents();
                                    Get.to(() => EventScreen(),
                                        arguments: eventController
                                            .categories[index].name);
                                  },
                                  child: CategoryCard(
                                    categoryModel:
                                        eventController.categories[index],
                                  ));
                            },
                            options: CarouselOptions(
                                // autoPlay: true,
                                autoPlayCurve: Curves.linearToEaseOut,
                                height: height * 0.46,
                                viewportFraction: 0.66,
                                enlargeCenterPage: true),
                          ),
                        ),

                        //leaderboard
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
