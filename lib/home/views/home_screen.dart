import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hestia_23/auth/controllers/auth_controller.dart';
import 'package:hestia_23/events/controllers/events_controller.dart';

import 'Event_Category_Card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final EventsController eventController = Get.find();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        actions: [
          IconButton(
              onPressed: () => authController.signout(),
              icon: Icon(Icons.logout)),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: eventController.events.length,
          itemBuilder: (context, index) =>
              Text(eventController.events[index].title),
        ),
      ),
    );
  }
}

//Event_Category

class EventCategory extends StatelessWidget {
  const EventCategory({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var cardh = 0.49 * h;
    var cardw = 0.55 * w;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
          alignment: Alignment.center,
          child: CarouselSlider(
            options: CarouselOptions(
                height: cardh, viewportFraction: 0.6, enlargeCenterPage: true),
            items: [
              CardEvents(
                  cardh: cardh,
                  cardw: cardw,
                  w: w,
                  imgurl: "assets/Eventcategory1.png",
                  eventcat: "Category"),
              CardEvents(
                  cardh: cardh,
                  cardw: cardw,
                  w: w,
                  imgurl: "assets/Eventcategory1.png",
                  eventcat: "Category"),
              CardEvents(
                  cardh: cardh,
                  cardw: cardw,
                  w: w,
                  imgurl: "assets/Eventcategory1.png",
                  eventcat: "Category"),
              CardEvents(
                  cardh: cardh,
                  cardw: cardw,
                  w: w,
                  imgurl: "assets/Eventcategory1.png",
                  eventcat: "Category"),
              CardEvents(
                  cardh: cardh,
                  cardw: cardw,
                  w: w,
                  imgurl: "assets/Eventcategory1.png",
                  eventcat: "Category"),
            ],
          )),
    );
  }
}
