import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/core/Constants..dart';
import 'package:hestia_23/events/controllers/events_controller.dart';

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
            pinned: false,
            floating: true,
            snap: true,
            titleSpacing: 20,
            title: Container(
                width: width * 0.09,
                height: width * 0.09,
                decoration: const BoxDecoration(
                  color: Color(0xff202020),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  size: height * 0.022,
                )),
          ),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
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
                          child:Obx(
                            ()=>DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                  borderRadius: BorderRadius.circular(15),
                                  isExpanded: true,
                                  isDense: false,
                                  value: controller.date.value,
                                  elevation: 0,
                                  items: EventsController.eventDates.map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value,style: FutTheme.font3.copyWith(fontSize: width*0.035)),
                                        );
                                      }).toList(),
                                  onChanged: (value) {
                                    controller.date.value= value!;
                                  },
                                ),
                              ),
                            ),
                          )
                        )
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
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(childCount: 6,
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
                            child: Image.asset("assets/images/encore11.jpg"),
                          ),
                        ),
                        SizedBox(
                            width: width * 0.6,
                            child: Text(
                              "LOGO ,WEB AND APP DESIGN COMPETITION",
                              style:
                                  FutTheme.mFont.copyWith(color: Colors.white),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            )),
                        Container(
                          height: cardHeight * 0.1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(43),
                              color: const Color(0xffFFD730)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    borderRadius: BorderRadius.circular(29)),
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
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
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
          itemCount: controller.departments.isEmpty
              ? 5
              : controller.departments.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: width * 0.022),
              child: Obx(
                () => Container(
                  alignment: Alignment.center,
                  width: width * 0.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33),
                      border: Border.all(color: const Color(0xffFFD730))),
                  child: controller.departmentLoading.value == true
                      ? Text(
                          "${controller.departments[index].title?.toUpperCase()}",
                          style: FutTheme.font6,
                        )
                      : const Text("....."),
                ),
              ),
            );
          }),
    );
  }
}
