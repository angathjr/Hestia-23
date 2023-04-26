import 'dart:developer';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hestia_23/core/api_provider.dart';

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

      if (message.notification != null) {
      }
    });
  }

  void subscribeToTopic() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final Response response = await api.getApi('/api/events/reg/events/');
      final List responseBody = response.body['results'];
      List eventSlugs = [];
      for (var e in responseBody) {
        eventSlugs.add(e['event']?['slug']);
      }
      eventSlugs.forEach((e) async {
        await messaging.subscribeToTopic('$e');
      });
    } on Exception catch (e) {
      Get.snackbar('Network Error', "Please check your network connectivity.");
    }
  }

  void fetchToken() async {
    String? token = await messaging.getToken();

    // TODO: Api call to register device token
  }
}
