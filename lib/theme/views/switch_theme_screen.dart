import 'package:flutter/material.dart';
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
        height: height * .5,
        child: Obx(
          () => Column(children: [
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
                        Text(
                          "Past Theme",
                          style:
                              Themes.pastFont.copyWith(fontSize: width * 0.07),
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
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      "Future Theme",
                      style:
                          Themes.futureFont.copyWith(fontSize: width * 0.055),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset("assets/images/future.png"),
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
                      child: Image.asset("assets/images/Present.png"),
                    ),
                    Text(
                      "Present Theme",
                      style:
                          Themes.presentFont.copyWith(fontSize: width * 0.07),
                    )
                  ]),
                ),
              ),
            ),
            verticalSpace(),
            verticalSpace(),
          ]),
        ),
      ),
    );
  }
}
