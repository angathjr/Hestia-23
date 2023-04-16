import 'dart:developer';

import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hestia_23/core/api_provider.dart';
import 'package:hestia_23/events/models/event.dart';

class FCMController extends GetxController {
  late FirebaseMessaging messaging;
  late NotificationSettings settings;
  final ApiProvider api = Get.find();

  @override
  void onInit() {
    super.onInit();

    messaging = FirebaseMessaging.instance;
    handleRequest();
    onListen();
    fetchToken();
    subscribeToTopic();
  }

  void handleRequest() async {
    settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  void onListen() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  void subscribeToTopic() async {
    List<EventModel> registeredEvents = [];

    try {
      await Future.delayed(Duration(seconds: 1));
      final Response response = await api.getApi('/api/events/reg/events/');
      registeredEvents = eventModelFromJson(response.body['results']);
      log(registeredEvents.toString());
      registeredEvents
          .map((e) async => await messaging.subscribeToTopic(e.slug ?? ''));
    } on Exception catch (e) {}
  }

  void fetchToken() async {
    String? token = await messaging.getToken();
    log(token!);

    // TODO: Api call to register device token
  }
}
