import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/core/Constants..dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import 'package:intl/intl.dart';
import '../controllers/event_pages_controller.dart';

class EventDetailsScreen extends StatelessWidget {
  EventDetailsScreen({Key? key}) : super(key: key);

  final EventsController eventsController = Get.find();
  final controller = Get.put(EventPagesController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double cardSize = (width - (2 * width * 0.04));

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
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
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //The poster will be placed here

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: width,
                        height: cardSize,
                        child: Image.network(
                          '${eventsController.selectedEvent.image}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    //Event name and venue

                    SizedBox(
                      height: height * 0.14,
                      width: width,
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            "${eventsController.selectedEvent.title}",
                            style: FutTheme.font1
                                .copyWith(fontSize: height * 0.028),
                          ),
                          Text(
                            "${eventsController.selectedEvent.dept?.title}",
                            style: FutTheme.font2
                                .copyWith(fontSize: height * 0.015),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: height * 0.02,
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                  "${eventsController.selectedEvent.venue?.title}",
                                  style: FutTheme.font2.copyWith(
                                      fontSize: height * 0.0135,
                                      color: const Color(0xff8C8984),
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          )
                        ],
                      ),
                    ),

                    //Reg fee  date and prize

                    Container(
                      width: width,
                      height: height * 0.09,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffD1D1D1)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Date",
                                  style: FutTheme.font3
                                      .copyWith(fontSize: height * 0.014),
                                ),
                                Text(
                                  DateFormat('MMM d').format(eventsController
                                      .selectedEvent.eventStart!),
                                  // "${eventsController.selectedEvent.eventStart?.day} / ${eventsController.selectedEvent.eventStart?.month}",
                                  style: FutTheme.font1.copyWith(
                                      fontSize: height * 0.018,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffd1d1d1)
                                        .withOpacity(0.7)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Prize",
                                      style: FutTheme.font3.copyWith(
                                          fontSize: height * 0.015,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '${eventsController.selectedEvent.prize}',
                                      style: FutTheme.font1.copyWith(
                                          fontSize: height * 0.03,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Fee",
                                    style: FutTheme.font3
                                        .copyWith(fontSize: height * 0.015),
                                  ),
                                  Text(
                                    '₹ ${(eventsController.selectedEvent.fees == null ? 0 : eventsController.selectedEvent.fees! / 100).toInt()}',
                                    style: FutTheme.font1.copyWith(
                                        fontSize: height * 0.018,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),

                    //About section starts here

                    Container(
                      width: width,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "ABOUT",
                        style:
                            FutTheme.font5.copyWith(fontSize: height * 0.023),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Obx(
                      () => Column(
                        children: [
                          Text(
                            '${eventsController.selectedEvent.desc}',
                            style: FutTheme.font4
                                .copyWith(fontSize: height * 0.018),
                            maxLines:
                                controller.isReadMore.value == false ? 4 : null,
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.justify,
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            height: height * 0.023,
                            //  color: Colors.red,
                            child: GestureDetector(
                                onTap: () {
                                  controller.readMore();
                                },
                                child: Text(
                                  (!controller.isReadMore.value)
                                      ? "Read More "
                                      : "Read Less",
                                  style: FutTheme.font4
                                      .copyWith(color: const Color(0xffDEFD72)),
                                )),
                          ),
                        ],
                      ),
                    ),

                    //Contact section

                    Container(
                      width: width,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "CONTACT",
                        style:
                            FutTheme.font5.copyWith(fontSize: height * 0.023),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        contactDetails(width, height,
                            '${eventsController.selectedEvent.coordinator1?.committeeName}'),
                        SizedBox(
                          width: width * 0.11,
                        ),
                        contactDetails(width, height,
                            '${eventsController.selectedEvent.coordinator1?.committeeName}'),
                      ],
                    ),

                    SizedBox(
                      height: height * 0.05,
                    ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   width: width,
                    //   height: height * 0.06,
                    //   decoration: BoxDecoration(
                    //       color: const Color(0xffDEFD72),
                    //       borderRadius: BorderRadius.circular(127)),
                    //   child: Text(
                    //     "REGISTER NOW >>",
                    //     style: FutTheme.font5.copyWith(
                    //         color: Colors.black, fontSize: height * 0.024),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: height * 0.05,
                    // ),
                  ],
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }

  SizedBox contactDetails(double width, double height, String name) {
    return SizedBox(
        width: width * 0.24,
        height: height * 0.07,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 0.09,
              height: width * 0.09,
              decoration: const BoxDecoration(
                  color: Color(0xffD1D1D1), shape: BoxShape.circle),
              child: Icon(
                Icons.call,
                size: width * 0.05,
              ),
            ),
            Text(
              name,
              style: FutTheme.font4.copyWith(fontSize: height * 0.02),
            )
          ],
        ));
  }
}
