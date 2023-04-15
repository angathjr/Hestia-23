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
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: _width / 20,
                    ),
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: _width / 15,
                          ),
                          Text(
                            "Hello User , Welcome ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: _width / 15,
                          ),
                          Text(
                            "To ",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            "Hestia 23",
                            style: TextStyle(
                                color: Colors.greenAccent, fontSize: 25),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width / 20,
                    ),
                    Text(
                      "STORIES",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: _height / 5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(15)),
                          width: _width / 3.5,
                          height: _height / 5,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                "username ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
