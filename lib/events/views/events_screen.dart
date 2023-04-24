import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hestia_23/core/constants..dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import 'package:hestia_23/theme/model/themes.dart';
import '../../core/widgets/back_button_widget.dart';

class EventScreen extends StatelessWidget {
  EventScreen({Key? key}) : super(key: key);

  final EventsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double cardHeight = height * 0.55;
    double squareCard = width - (2 * width * 0.04) - (2 * width * 0.05);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            //app bar
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: false,
              floating: true,
              snap: true,
              titleSpacing: 20,
              // backgroundColor: Colors.transparent,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () => Get.back(), child: const BackButtonWidget()),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    Get.arguments.toString(),
                    style: context.theme.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),

                      // list of department
                      departmentSection(height, width),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          Text(
                            "Date",
                            style: FutTheme.font6
                                .copyWith(fontSize: width * 0.036),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Container(
                              height: height * 0.04,
                              width: width * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(33),
                                  border: Border.all(
                                      color: context.theme.primaryColor)),
                              child: Obx(
                                () => DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton(
                                      borderRadius: BorderRadius.circular(15),
                                      isExpanded: true,
                                      isDense: false,
                                      value: controller.date.value,
                                      elevation: 0,
                                      items: EventsController.eventDates
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value,
                                              style: FutTheme.font3.copyWith(
                                                  fontSize: width * 0.033)),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        controller.setDate(value!);
                                      },
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),

                      SizedBox(
                        height: height * 0.03,
                      ),
                    ],
                  ),
                )),

            // The list of cards are starts from here

            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              sliver: Obx(
                () => (controller.eventsLoading.value == false)
                    ? (controller.events.isEmpty)
                        ? SliverToBoxAdapter(
                            child: Center(
                              child: Text(
                                "No Events",
                                style: context.theme.textTheme.titleLarge
                                    ?.copyWith(
                                        color: Colors.white54,
                                        fontSize: width * 0.05),
                              ),
                            ),
                          )
                        : AnimationLimiter(
                            child: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  childCount: controller.events.length,
                                  (BuildContext context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 100),
                                  child: SlideAnimation(
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    duration:
                                        const Duration(milliseconds: 2500),
                                    verticalOffset: -50,
                                    child: FadeInAnimation(
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration:
                                          const Duration(milliseconds: 2500),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: height * 0.02),
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.goToEvent(
                                                controller.events[index]);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: width * 0.05),
                                            height: cardHeight,
                                            width: width,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 40,
                                                      spreadRadius: 10,
                                                      color: Colors.black
                                                          .withOpacity(0.1))
                                                ],
                                                border: Border.all(
                                                    color: context
                                                        .theme.primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                  child: Container(
                                                    width: squareCard,
                                                    height: squareCard,
                                                    decoration:
                                                        const BoxDecoration(),
                                                    child: CachedNetworkImage(
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              Center(
                                                        child: CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation(
                                                                    context
                                                                        .theme
                                                                        .disabledColor),
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                      imageUrl:
                                                          '${controller.events[index].image}',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: width * 0.6,
                                                    child: Text(
                                                      "${controller.events[index].title}",
                                                      style: context.theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        color: Colors.white,
                                                      ),
                                                      softWrap: true,
                                                      textAlign:
                                                          TextAlign.center,
                                                    )),
                                                Container(
                                                  height: cardHeight * 0.1,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: context
                                                          .theme.primaryColor),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      const Spacer(
                                                        flex: 9,
                                                      ),
                                                      Text("View Details",
                                                          style:
                                                              FutTheme.mFont),
                                                      const Spacer(
                                                        flex: 5,
                                                      ),
                                                      Container(
                                                        height:
                                                            cardHeight * 0.082,
                                                        width: cardHeight * 0.1,
                                                        decoration: BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        23)),
                                                        child: Transform.rotate(
                                                          angle: pi / 3,
                                                          child: const Icon(
                                                            Icons
                                                                .arrow_upward_rounded,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      const Spacer()
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          )
                    : SliverToBoxAdapter(
                        child: SizedBox(
                            height: height * 0.6,
                            width: width,
                            child: Center(
                              child: primaryLoadingWidget,
                            ))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox departmentSection(double height, double width) {
    return SizedBox(
      height: height * 0.04,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: controller.departments.isEmpty
              ? 5
              : controller.departments.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: width * 0.022),
              child: Obx(
                () => GestureDetector(
                  onTap: () => controller.setDepartmentIndex(index),
                  child: Container(
                    alignment: Alignment.center,
                    width: width * 0.35,
                    decoration: BoxDecoration(
                        color: controller.selectedDepartmentIndex.value == index
                            ? context.theme.primaryColor
                            : null,
                        borderRadius: BorderRadius.circular(33),
                        border: Border.all(color: context.theme.primaryColor)),
                    child: controller.departmentLoading.value == true
                        ? Text(
                            "${controller.departments[index].title?.toUpperCase()}",
                            style: controller.selectedDepartmentIndex.value !=
                                    index
                                ? FutTheme.font6
                                : FutTheme.font6
                                    .copyWith(color: const Color(0xff373737)),
                          )
                        : const Text("....."),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
