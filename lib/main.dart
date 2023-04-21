import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hestia_23/Schedule/views/Schedule.dart';
import 'package:hestia_23/animations/views/side_transitions.dart';
import 'package:hestia_23/events/views/event_details_screen.dart';
import 'package:hestia_23/events/views/events_search_screen.dart';
import 'package:hestia_23/navbar/views/navbar_screen.dart';
import 'package:hestia_23/notifications/views/notification_screen.dart';
import 'package:hestia_23/profile/views/profile_screen.dart';
import 'package:hestia_23/profile/views/profile_completion_screen.dart';
import 'package:hestia_23/stories/views/story_view.dart';
import 'auth/views/login_screen.dart';
import 'events/views/event_detail_screen2.dart';
import 'getx_di.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  GetXDependancyInjector().onInit();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      title: 'Hestia 23',
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
              color: Colors.black, scrolledUnderElevation: 0)),
      // home: NavBarPage(),
      getPages: [
        GetPage(
            name: '/',
            page: () => storage.hasData('authToken')
                ? storage.read('isComplete') ?? false
                    ? NavBarPage()
                    : ProfileCompletion()
                : LoginScreen()),
        // GetPage(name: '/posts', page: () => PostsScreen()),
        GetPage(name: "/schedule", page: () => Schedule()),
        GetPage(name: '/login', page: () => LoginScreen()),
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
        ),
      ],
    );
  }
}
