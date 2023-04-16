import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/home/views/home_screen.dart';
import 'package:hestia_23/profile/views/profile.dart';

import '../controllers/navbar_controller.dart';


class NavBarPage extends StatelessWidget {
  NavBarPage({Key? key}) : super(key: key);

  var pages =  [
   HomeScreen(),
    Profile(),
    HomeScreen(),
    Profile(),
  ];

  final navController = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double topHeight = height * 0.915;
    double navHeight = (height - topHeight) - (width * 0.035 * 2);

    return Scaffold(body: Container(
      width: width,
      height: height,
      child: Column(
        children: [


          //pageview

          SizedBox(
            width: width,
            height: topHeight,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: navController.controller,
              children: pages,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(width * 0.03),
              width: width,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff111111),
                  borderRadius: BorderRadius.circular(15),
                ),

                // The nav bar icons are placed here

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildNavIcons(
                        navHeight: navHeight,
                        w: 0.40,
                        h: 0.40,
                        index: 0,
                  icon:Icon(Icons.home_filled),),

                    buildNavIcons(
                        navHeight: navHeight,
                        w: 0.35,
                        h: 0.35,
                        index: 1, icon: Icon(Icons.calendar_today_outlined),

                    ),
                    buildNavIcons(
                        navHeight: navHeight,
                        w: 0.35,
                        h: 0.35,
                        index: 2, icon: Icon(Icons.notifications)),
                    buildNavIcons(
                        navHeight: navHeight,
                        w: 0.35,
                        h: 0.35,
                        index: 3, icon: Icon(Icons.person)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  InkWell buildNavIcons(
      {required double navHeight,
        required Icon icon,
        required double w,
        required double h,
        required int index}) {
    return InkWell(
      onTap: () {
        navController.changePage(index, navController.controller);
        navController.index.value = index;
      },
      child: SizedBox(
          width: navHeight * w,
          height: navHeight * h,
          child: icon
      ),
    );
  }
}


//TODO: this is only a sample nav bar for testing, need to rebuild it