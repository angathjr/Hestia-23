import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hestia_23/theme/controllers/theme_controller.dart';
import '../model/themes.dart';

class SwitchThemeScreen extends StatelessWidget {
  SwitchThemeScreen({super.key});

  Widget verticalSpace() => const SizedBox(
        height: 5,
      );

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: width,
        height: height * .75,
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Themes().switchTheme(0);
                    themeController.changeIndex(0);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: (themeController.selectedIndex.value == 0)
                            ? context.theme.primaryColor
                            : Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    width: width,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            child: Image.asset("assets/images/Past.png"),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Center(
                                child: Text(
                                  "Past Theme",
                                  style: Themes.pastFont.copyWith(
                                      fontSize: width * 0.07,
                                      color:
                                          themeController.selectedIndex.value ==
                                                  0
                                              ? Colors.black
                                              : null),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: SizedBox(
                                  width: width * 0.5,
                                  child: AnimationConfiguration.synchronized(
                                    child: FadeInAnimation(
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration:
                                          const Duration(milliseconds: 1500),
                                      child: Text(
                                        "Greetings, traveler. I am Loki, or at least "
                                        "that was the name I was given during the Battle"
                                        " of Ichi- no-Tani in the year 1184. You see, I was"
                                        " not always a samurai. I was once a time traveler, "
                                        "on a mission to journey back to the very beginning "
                                        "of mankind to meet the goddess Hestia. But alas, I "
                                        "somehow ended up here. You cannot choose me at this "
                                        "moment, for I am not here.",
                                        style: Themes.pastFont.copyWith(
                                          color: themeController
                                                      .selectedIndex.value ==
                                                  0
                                              ? Colors.black38
                                              : Colors.white38,
                                          fontSize: width * 0.025,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          )
                        ]),
                  ),
                ),
              ),
              verticalSpace(),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Themes().switchTheme(1);
                    themeController.changeIndex(1);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: width,
                    decoration: BoxDecoration(
                        color: (themeController.selectedIndex.value == 1)
                            ? context.theme.primaryColor
                            : Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Center(
                                child: Text(
                                  "Present Theme",
                                  style: Themes.presentFont.copyWith(
                                      fontSize: width * 0.07,
                                      color:
                                          themeController.selectedIndex.value ==
                                                  1
                                              ? Colors.black
                                              : null),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: SizedBox(
                                  width: width * 0.45,
                                  child: AnimationConfiguration.synchronized(
                                    child: FadeInAnimation(
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration:
                                          const Duration(milliseconds: 1500),
                                      child: Text(
                                        "Yo, what's good? The name's Leo. I know, I know a "
                                        "time-traveling fox? - Crazy, right? But trust me, I've "
                                        "even seen crazier stuff in my time. Here's the deal my "
                                        "time machine's on the fritz, so I'm kinda stuck here. I "
                                        "should reach there before the Battle of Ichi-no-Tani.",
                                        style: Themes.presentFont.copyWith(
                                          color: themeController
                                                      .selectedIndex.value ==
                                                  1
                                              ? Colors.black38
                                              : Colors.white38,
                                          fontSize: width * 0.03,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            child: Image.asset("assets/images/Present.png"),
                          ),
                        ]),
                  ),
                ),
              ),
              verticalSpace(),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Themes().switchTheme(2);
                    themeController.changeIndex(2);
                  },
                  child: Container(
                    // height: height * 0.2,
                    width: width,
                    decoration: BoxDecoration(
                        color: (themeController.selectedIndex.value == 2)
                            ? context.theme.primaryColor
                            : Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        child: Image.asset("assets/images/future.png"),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Center(
                            child: Text(
                              "Future Theme",
                              style: Themes.futureFont.copyWith(
                                  fontSize: width * 0.055,
                                  color:
                                      themeController.selectedIndex.value == 2
                                          ? Colors.black
                                          : null),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SizedBox(
                              width: width * 0.5,
                              child: AnimationConfiguration.synchronized(
                                child: FadeInAnimation(
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  duration: const Duration(milliseconds: 1500),
                                  child: Text(
                                    "Hello, I'm Dr. Lex Brown. I'm currently having trouble with "
                                    "the quantum field that powers the machine and must find a solution "
                                    "quickly. Additionally, I need to reach Hestia, the ancient artifact "
                                    "that powers the time circuits, before the fell riders do. Time is "
                                    "running out, and I'm determined to fix the machine and complete my "
                                    "mission.",
                                    style: Themes.futureFont.copyWith(
                                      color:
                                          themeController.selectedIndex.value ==
                                                  2
                                              ? Colors.black38
                                              : Colors.white38,
                                      fontSize: width * 0.024,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
