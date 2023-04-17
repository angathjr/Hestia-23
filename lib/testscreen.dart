import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/Schedule/views/Schedule.dart';
import 'package:hestia_23/events/views/event_details_screen.dart';
import 'package:hestia_23/events/views/events_screen.dart';
import 'package:hestia_23/navbar/views/navbar_screen.dart';


class AllScreens extends StatelessWidget {
  const AllScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ElevatedButton(onPressed: (){
              Get.to(()=>NavBarPage());
            }, child: Text("NavBar")),
            ElevatedButton(onPressed: (){
              Get.to(()=>EventScreen());
            }, child: Text("events")),
            ElevatedButton(onPressed: (){
              Get.to(()=>EventDetailsScreen());
            }, child: Text("event details")),
            ElevatedButton(onPressed: (){
              Get.to(()=>Schedule());
            }, child: Text("schedule")),
            ElevatedButton(onPressed: (){}, child: Text("story")),
            ElevatedButton(onPressed: (){}, child: Text("leaderboard")),

          ],

        ),
      ),
    );
  }
}
