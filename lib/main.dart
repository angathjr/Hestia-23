import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import './views/login_screen.dart';
import 'views/home_screen.dart';

import 'getx_di.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      home: LoginScreen(),
      // getPages: [
      //   GetPage(
      //       name: '/',
      //       page: () => storage.hasData('user') ? HomeScreen() : LoginScreen()),
      // GetPage(name: '/posts', page: () => PostsScreen()),
      //   GetPage(name: '/login', page: () => LoginScreen()),
      // ],
    );
  }
}
