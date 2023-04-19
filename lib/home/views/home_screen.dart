import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/auth/controllers/auth_controller.dart';
import 'package:hestia_23/core/Constants..dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import 'package:hestia_23/stories/views/stories_widget.dart';
import 'leaderboard_card.dart';
import 'package:hestia_23/events/views/events_screen.dart';
import 'package:hestia_23/fcm/controllers/fcm_controller.dart';
import 'package:hestia_23/profile/views/profile_completion_screen.dart';

import 'event_category_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final EventsController eventController = Get.find();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: Image.asset(
                "assets/images/mascot.png",
                scale: 2.2,
              ),
              actions: [
                IconButton(
                  onPressed: () => Get.toNamed('/search'),
                  icon: const Icon(
                    CupertinoIcons.search
                  )
                ),
              ],
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      height: height*1.7,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/bg.png")
                        )
                      ),

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
                            padding: EdgeInsets.only(top: height*0.04,bottom: height*0.03),
                            child: Container(
                              alignment: Alignment.center,
                              width: width,
                              // height: height * 0.08,
                              child:  Text("EXPLORE EVENTS",style: FutTheme.categoryFont.copyWith(fontSize:width*0.08 ),),
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
                                return CategoryCard(
                                  onTap: () {
                                    eventController.selectedCategory =
                                        eventController.categories[index];
                                    eventController.fetchEvents();
                                    Get.to(() => EventScreen(),
                                        arguments: eventController
                                            .categories[index].name);
                                  },
                                  categoryModel:
                                      eventController.categories[index],
                                );
                              },
                              options: CarouselOptions(
                                  // autoPlay: true,
                                  autoPlayCurve: Curves.linearToEaseOut,
                                  height: height * 0.46,
                                  viewportFraction: 0.72,
                                  enlargeCenterPage: true),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.2,
                          ),
                          //leaderboard
                          SizedBox(
                            width: width,
                            child: LeaderBoard.futureLeaderboard(
                                height*0.8, context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
