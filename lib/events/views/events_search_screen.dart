import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hestia_23/Schedule/filter/schedule_filter_view.dart';
import 'package:hestia_23/core/Constants..dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import 'package:hestia_23/events/controllers/events_search_controller.dart';

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
    double searchHeight = height * 0.06;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
            child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          slivers: [
            //app bar

            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: false,
              snap: false,
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
                    style: context.theme.textTheme.titleLarge,
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(searchHeight + 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 11,
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                  color: const Color(0xff1E1E1E),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextField(
                                textAlign: TextAlign.left,
                                style: FutTheme.font3,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(CupertinoIcons.search),
                                    hintText: "Search events here",
                                    contentPadding: EdgeInsets.only(left: 20),
                                    border: InputBorder.none),
                                onChanged: (value) =>
                                    searchController.textFieldOnChanged(),
                                controller: searchController.editingController,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xff1E1E1E)),
                              child: IconButton(
                                  icon: Icon(FeatherIcons.filter,
                                      size: width * 0.06),
                                  onPressed: () =>
                                      Get.to(() => FilterScreen())),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
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
                                  border: Border.all(
                                      color: context.theme.primaryColor)),
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
                () => (searchController.eventsLoading.value == false)
                    ? AnimationLimiter(
                        child: SliverList(
                          delegate: SliverChildBuilderDelegate(
                              childCount: searchController.events.length,
                              (BuildContext context, index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 100),
                              child: SlideAnimation(
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: const Duration(milliseconds: 2500),
                                verticalOffset: 300,
                                horizontalOffset: 30,
                                child: FlipAnimation(
                                    flipAxis: FlipAxis.y,
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: height * 0.02),
                                        child: Container(
                                          height: cardHeight,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    context.theme.primaryColor),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Row(children: [
                                            Expanded(
                                              child: Container(
                                                width: width * 0.4,
                                                margin: EdgeInsets.all(
                                                    width * 0.025),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: context.theme
                                                            .canvasColor)),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            Center(
                                                      child: CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation(
                                                                  context.theme
                                                                      .primaryColor),
                                                          value:
                                                              downloadProgress
                                                                  .progress),
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
                                                  margin: EdgeInsets.all(
                                                      width * 0.025),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      SizedBox(
                                                        child: Text(
                                                          "${searchController.events[index].title}",
                                                          style: FutTheme.mFont
                                                              .copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      width *
                                                                          0.045),
                                                          softWrap: true,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          eventsController
                                                              .goToEvent(
                                                                  searchController
                                                                          .events[
                                                                      index]);
                                                        },
                                                        child: Container(
                                                          height:
                                                              height * 0.045,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      width *
                                                                          0.02),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color: context
                                                                  .theme
                                                                  .primaryColor),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                              "View Details",
                                                              style: FutTheme
                                                                  .mFont),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                            )
                                          ]),
                                        ))),
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
        )),
      ),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    width: width * 0.35,
                    decoration: BoxDecoration(
                      color: searchController.selectedDepartmentIndex.value ==
                              index
                          ? context.theme.primaryColor
                          : null,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: context.theme.primaryColor),
                    ),
                    child: eventsController.departmentLoading.value == true
                        ? FittedBox(
                            child: Text(
                              "${eventsController.departments[index].title?.toUpperCase()}",
                              style: searchController
                                          .selectedDepartmentIndex.value !=
                                      index
                                  ? FutTheme.font6
                                  : FutTheme.font6
                                      .copyWith(color: const Color(0xff373737)),
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
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
