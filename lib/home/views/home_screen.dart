import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hestia_23/auth/controllers/auth_controller.dart';
import 'package:hestia_23/events/controllers/events_controller.dart';

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
