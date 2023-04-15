import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hestia_23/events/views/event_details_screen.dart';
import 'package:hestia_23/events/views/events_screen.dart';
import 'package:hestia_23/profile/views/profile_completion_screen.dart';
import 'auth/views/login_screen.dart';
import 'getx_di.dart';
import './home/views/home_screen.dart';

void main() async {
  GetXDependancyInjector().onInit();
  await GetStorage.init();
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
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(color: Colors.black)),
      initialRoute: '/',
      // home: LoginScreen(),
      getPages: [
        GetPage(name: '/', page: () => EventScreen()),
        //  storage.hasData('authToken')
        //     ? storage.read('isComplete') ?? false
        //         ? HomeScreen()
        //         : const ProfileCompletion()
        //     : LoginScreen()),
        // GetPage(name: '/posts', page: () => PostsScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
      ],
    );
  }
}
