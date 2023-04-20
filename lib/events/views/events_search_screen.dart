import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/core/Constants..dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import 'package:hestia_23/events/controllers/events_search_controller.dart';
import 'package:hestia_23/events/views/event_details_screen.dart';

import '../../core/widgets/back_button_widget.dart';

class EventsSearchScreen extends StatelessWidget {
  EventsSearchScreen({Key? key}) : super(key: key);

  final EventsController eventsController = Get.find();
  final EventsSearchController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double cardHeight = height * 0.2;
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
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () => Get.back(), child: const BackButtonWidget()),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'SEARCH',
                  style: FutTheme.categoryFont,
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

                    //TODO: search needed to be implemented

                    Container(
                      alignment: Alignment.center,
                      height: height * 0.065,
                      width: width,
                      decoration: BoxDecoration(
                          color: const Color(0xff1E1E1E),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        style: FutTheme.font3,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20),
                            border: InputBorder.none),
                        onChanged: (value) =>
                            searchController.textFieldOnChanged(),
                        controller: searchController.editingController,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
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
                          style:
                              FutTheme.font6.copyWith(fontSize: width * 0.04),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Container(
                            height: height * 0.047,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: const Color(0xffFFD730))),
                            child: Obx(
                              () => DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    borderRadius: BorderRadius.circular(20),
                                    isExpanded: true,
                                    isDense: false,
                                    value: searchController.date.value,
                                    elevation: 0,
                                    items: EventsSearchController.eventDates
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value,
                                            style: FutTheme.font3.copyWith(
                                                fontSize: width * 0.035)),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      searchController.setDate(value!);
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
              () => SliverList(
                delegate: SliverChildBuilderDelegate(
                    childCount: searchController.events.length,
                    (BuildContext context, index) {
                  return Padding(
                      padding: EdgeInsets.only(bottom: height * 0.02),
                      child: Container(
                        height: cardHeight,
                        decoration: BoxDecoration(
                          border: Border.all(color: FutTheme.secondaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(children: [
                          Expanded(
                            child: Container(
                              width: width * 0.4,
                              margin: EdgeInsets.all(width * 0.025),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: FutTheme.secondaryColor)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            FutTheme.primaryColor),
                                        value: downloadProgress.progress),
                                  ),
                                  imageUrl:
                                      '${searchController.events[index].image}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                width: width * 0.4,
                                margin: EdgeInsets.all(width * 0.025),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      child: Text(
                                        "${searchController.events[index].title}",
                                        style: FutTheme.mFont.copyWith(
                                            color: Colors.white,
                                            fontSize: width * 0.045),
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        eventsController.goToEvent(
                                            searchController.events[index]);
                                      },
                                      child: Container(
                                        height: height * 0.045,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: width * 0.02),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: FutTheme.secondaryColor),
                                        alignment: Alignment.center,
                                        child: Text("View Details",
                                            style: FutTheme.mFont),
                                      ),
                                    )
                                  ],
                                )),
                          )
                        ]),
                      ));
                }),
              ),
            ),
          ),
        ],
      )),
    );
  }

  SizedBox departmentSection(double height, double width) {
    return SizedBox(
      height: height * 0.048,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: eventsController.departments.isEmpty
              ? 5
              : eventsController.departments.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: width * 0.022),
              child: Obx(
                () => GestureDetector(
                  onTap: () => searchController.setDepartmentIndex(index),
                  child: Container(
                    alignment: Alignment.center,
                    width: width * 0.35,
                    decoration: BoxDecoration(
                        color: searchController.selectedDepartmentIndex.value ==
                                index
                            ? const Color(0xffFFD730)
                            : null,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xffFFD730))),
                    child: eventsController.departmentLoading.value == true
                        ? Text(
                            "${eventsController.departments[index].title?.toUpperCase()}",
                            style: searchController
                                        .selectedDepartmentIndex.value !=
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
