import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/profile/controllers/profile_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qrscreen extends StatelessWidget {
  Qrscreen({super.key});

  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.6,
      child: Column(children: [
        Obx(
          () => (profileController.regEvents.length == 1)
              ? Padding(
                  padding: EdgeInsets.all(width * 0.07),
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        height: height * 0.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Expanded(
                              flex: 13,
                              child: Container(
                                // width: width * 0.8,
                                margin: EdgeInsets.all(width * 0.03),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: QrImage(
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.all(width * 0.05),
                                  data: profileController.regTeamSlug[0]
                                      .toString(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.015,
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "${profileController.regEvents[0].title}",
                                  style: context.theme.textTheme.titleLarge
                                      ?.copyWith(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : CarouselSlider.builder(
                  itemCount: profileController.regTeamSlug.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Container(
                      width: width,
                      height: height * 0.6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Expanded(
                            flex: 13,
                            child: Container(
                              // width: width * 0.8,
                              margin: EdgeInsets.all(width * 0.03),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: QrImage(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.all(width * 0.05),
                                data: profileController.regTeamSlug[index]
                                    .toString(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "${profileController.regEvents[index].title}",
                                style: context.theme.textTheme.titleLarge
                                    ?.copyWith(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                      reverse: false,
                      viewportFraction: 0.83,
                      height: height * 0.5,
                      enlargeCenterPage: true),
                ),
        ),
      ]),
    );
  }
}
