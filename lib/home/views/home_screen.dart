import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hestia_23/auth/controllers/auth_controller.dart';
import 'package:hestia_23/core/constants..dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import 'package:hestia_23/home/views/event_category_card_past.dart';
import 'package:hestia_23/home/views/event_category_card_present.dart';
import 'package:hestia_23/notifications/controllers/notification_controller.dart';
import 'package:hestia_23/profile/controllers/profile_controller.dart';
import 'package:hestia_23/stories/views/stories_widget.dart';
import 'package:hestia_23/events/views/events_screen.dart';
import 'package:hestia_23/theme/controllers/theme_animation_controller.dart';
import 'package:hestia_23/theme/controllers/theme_controller.dart';
import 'package:hestia_23/theme/model/themes.dart';
import 'package:hestia_23/theme/views/switch_theme_screen.dart';
import 'event_category_card_future.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final EventsController eventController = Get.find();
  final AuthController authController = Get.find();
  final ProfileController profController = Get.find();
  final ThemeAnimationController themeAnimationController =
      Get.put(ThemeAnimationController());
  final NotificationController notificationController = Get.find();
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                opacity: 0.25,
                image: Themes().backgroundImage)),
        child: SafeArea(
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                snap: false,
                primary: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
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
                              themeAnimationController.animationController,
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
                    AnimationConfiguration.synchronized(
                      child: FadeInAnimation(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: const Duration(milliseconds: 1500),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "HI ${profController.user.value.name?.split(' ').first.toUpperCase()}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(fontSize: width * 0.038)),
                            const SizedBox(
                              height: 7,
                            ),
                            SizedBox(
                              width: width * 0.5,
                              child: Text("WELCOME TO THE TIMELESS ODYSSEY",
                                  overflow: TextOverflow.clip,
                                  style: context.theme.textTheme.headlineMedium
                                      ?.copyWith(fontSize: width * 0.025)),
                            ),
                          ],
                        ),
                      ),
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
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                    Column(
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
                              top: height * 0.05, bottom: height * 0.03),
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
                          height: height * 0.45,
                          width: width,
                          child: AnimationLimiter(
                            child: CarouselSlider.builder(
                              itemCount: eventController.categories.length,
                              itemBuilder: (BuildContext context, int index,
                                  int realIndex) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 100),
                                  child: SlideAnimation(
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    verticalOffset: -50,
                                    child: FadeInAnimation(
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration:
                                          const Duration(milliseconds: 1500),
                                      child: GestureDetector(
                                          onTap: () {
                                            eventController.selectedCategory =
                                                eventController
                                                    .categories[index];
                                            eventController.fetchEvents();
                                            Get.to(() => EventScreen(),
                                                arguments: eventController
                                                    .categories[index].name);
                                          },
                                          child: themeController
                                                      .selectedIndex.value ==
                                                  0
                                              ? CategoryCardPast(
                                                  categoryModel: eventController
                                                      .categories[index],
                                                )
                                              : themeController.selectedIndex
                                                          .value ==
                                                      1
                                                  ? CategoryCardPresent(
                                                      categoryModel:
                                                          eventController
                                                                  .categories[
                                                              index],
                                                    )
                                                  : CategoryCardFuture(
                                                      categoryModel:
                                                          eventController
                                                                  .categories[
                                                              index],
                                                    )),
                                    ),
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                  // autoPlay: true,
                                  autoPlayCurve: Curves.linearToEaseOut,
                                  height: height * 0.46,
                                  viewportFraction: 0.66,
                                  enlargeCenterPage: true),
                            ),
                          ),
                        ),

                        //leaderboard
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
