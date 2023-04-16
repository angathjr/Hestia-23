import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/auth/controllers/auth_controller.dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import 'package:hestia_23/profile/views/profile_completion_screen.dart';

import 'event_category_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final EventsController eventController = Get.find();
  final AuthController authController = Get.find();

  final List _stories = [
    "user1",
    "user2",
    "user3",
    "user1",
    "user2",
    "user3",
    "user1",
    "user2",
    "user3",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Scaffold(
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Image.asset(
                "assets/images/mascot.png",
                scale: 2.2,
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Stack(
                      children: [
                        //The background image is placed here
                        SizedBox(
                          width: double.infinity,
                          height:  height,
                          child: Image.asset(
                            'assets/images/bg.png',
                            fit: BoxFit.cover,
                          ),
                        ),

                        //other stack elements

                        Column(
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            SizedBox(
                              width: width,
                              child: Image.asset("assets/images/story2.png"),
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),

                            //the category screen placed here

                            SizedBox(
                              height: height * 0.5,
                              width: width,
                              child:

                              CarouselSlider.builder(
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index,
                                    int realIndex) {
                                  return const CategoryCard();
                                },
                                options: CarouselOptions(
                                 // autoPlay: true,
                                  autoPlayCurve: Curves.linearToEaseOut,
                                  height: height*0.46,
                                  viewportFraction: 0.72,
                                  enlargeCenterPage: true
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.1,
                            ),
                            SizedBox(
                              width: width,
                              child: Image.asset("assets/images/leader.png"),
                            ),
                            SizedBox(
                              height: height * 0.4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ))
          ],
        )),
      ),
    );
  }
}

