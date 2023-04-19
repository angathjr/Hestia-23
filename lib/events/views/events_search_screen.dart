import 'dart:math';

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
                      height: height * 0.065,
                      width: width,
                      decoration: BoxDecoration(
                          color: const Color(0xff1E1E1E),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextField(
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
                                borderRadius: BorderRadius.circular(33),
                                border:
                                    Border.all(color: const Color(0xffFFD730))),
                            child: Obx(
                              () => DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    borderRadius: BorderRadius.circular(15),
                                    isExpanded: true,
                                    isDense: false,
                                    value: eventsController.date.value,
                                    elevation: 0,
                                    items: EventsController.eventDates
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
                                      eventsController.date.value = value!;
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
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      height: cardHeight,
                      width: width,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffFFD730)),
                          borderRadius: BorderRadius.circular(40)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                            child: Container(
                              width: squareCard,
                              height: squareCard,
                              decoration: const BoxDecoration(),
                              child: Image.network(
                                '${searchController.events[index].image}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: width * 0.6,
                              child: Text(
                                "${searchController.events[index].title}",
                                style: FutTheme.mFont
                                    .copyWith(color: Colors.white),
                                softWrap: true,
                                textAlign: TextAlign.center,
                              )),
                          GestureDetector(
                            onTap: () {
                              eventsController.selectedEvent =
                                  eventsController.events[index];
                              Get.to(EventDetailsScreen());
                            },
                            child: Container(
                              height: cardHeight * 0.1,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(43),
                                  color: const Color(0xffFFD730)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Spacer(
                                    flex: 9,
                                  ),
                                  Text("View Details", style: FutTheme.mFont),
                                  const Spacer(
                                    flex: 5,
                                  ),
                                  Container(
                                    height: cardHeight * 0.082,
                                    width: cardHeight * 0.1,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(29)),
                                    child: Transform.rotate(
                                      angle: pi / 3,
                                      child: const Icon(
                                        Icons.arrow_upward_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Spacer()
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
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
                        borderRadius: BorderRadius.circular(33),
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
