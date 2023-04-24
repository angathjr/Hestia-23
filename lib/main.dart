import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hestia_23/Schedule/views/schedule.dart';
import 'package:hestia_23/events/views/event_details_screen.dart';
import 'package:hestia_23/events/views/events_search_screen.dart';
import 'package:hestia_23/navbar/views/navbar_screen.dart';
import 'package:hestia_23/notifications/views/notification_screen.dart';
import 'package:hestia_23/profile/views/profile_screen.dart';
import 'package:hestia_23/profile/views/profile_completion_screen.dart';
import 'package:hestia_23/stories/views/story_view.dart';
import 'auth/views/login_screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'getx_di.dart';
import 'package:hestia_23/theme/model/themes.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  // print("Handling a background message: ${message.messageId}");
}

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await GetStorage.init();
    GetXDependancyInjector().onInit();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(MyApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      title: 'Hestia 23',
      theme: Themes().theme,
      getPages: [
        GetPage(
            name: '/',
            page: () => storage.hasData('authToken')
                ? storage.read('isComplete') ?? false
                    ? NavBarPage()
                    : ProfileCompletion()
                : const LoginPage()),
        // GetPage(name: '/posts', page: () => PostsScreen()),
        GetPage(name: '/navbar', page: () => NavBarPage()),
        GetPage(name: "/schedule", page: () => Schedule()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(
          name: '/search',
          page: () => EventsSearchScreen(),
          curve: Curves.fastLinearToSlowEaseIn,
          transitionDuration: const Duration(milliseconds: 1000),
        ),
        GetPage(name: '/event', page: () => EventDetailsScreen()),
        GetPage(name: '/story-view', page: () => StoriesViewScreen()),
        GetPage(
          name: '/notification-1',
          page: () => NotificationScreen(),
          curve: Curves.fastLinearToSlowEaseIn,
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      ],
    );
  }
}
