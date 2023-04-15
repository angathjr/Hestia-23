import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import 'package:hestia_23/profile/views/profile_completion_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final EventsController eventController = Get.find();

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
    final _size = MediaQuery.of(context).size;
    final _height = _size.height;
    final _width = _size.width;
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 40, 0, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(ProfileCompletion());
                      },
                      child: CircleAvatar(
                        radius: 35,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                  child: Text(
                    "Hello User , Welcome \nTo Hestia 23",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              itemCount: eventController.events.length,
              itemBuilder: (context, index) => Text(
                eventController.events[index].title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
