import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/Constants..dart';
import '../../core/widgets/back_button_widget.dart';
import '../controllers/event_pages_controller.dart';
import '../controllers/events_controller.dart';

class EventDetailsScreen2 extends StatelessWidget {
  EventDetailsScreen2({super.key});

  final EventsController eventsController = Get.find();
  final controller = Get.put(EventPagesController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double cardSize = width * 0.8;
    double padd = width * 0.04;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              snap: false,
              titleSpacing: 20,
              title: GestureDetector(
                  onTap: () => Get.back(), child: const BackButtonWidget()),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(height * 0.04),
                child: SizedBox(
                  height: height * 0.04,
                  child: Text(
                    "${eventsController.selectedEvent.title}",
                    style: FutTheme.font1.copyWith(fontSize: height * 0.028),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),

                    //The poster will be placed here

                    SizedBox(
                      height: cardSize * 1.1,
                      width: width,
                      child: Row(
                        children: [
                          //card

                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                                width: cardSize * 0.7,
                                height: cardSize * 1.1,
                                child: CachedNetworkImage(
                                  placeholder: (context, url) =>
                                      primaryLoadingWidget,
                                  imageUrl:
                                      '${eventsController.selectedEvent.image}',
                                  fit: BoxFit.cover,
                                )),
                          ),

                          //detail elements

                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                //date section

                                Container(
                                  width: width,
                                  margin: EdgeInsets.only(left: padd),
                                  height: cardSize * 0.27,
                                  decoration: BoxDecoration(
                                      color: FutTheme.primaryBg,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Date",
                                        style: FutTheme.font3
                                            .copyWith(fontSize: height * 0.014),
                                      ),
                                      Text(
                                        DateFormat('MMM d').format(
                                            eventsController
                                                .selectedEvent.eventStart!),
                                        // "${eventsController.selectedEvent.eventStart?.day} / ${eventsController.selectedEvent.eventStart?.month}",
                                        style: FutTheme.font1.copyWith(
                                            fontSize: height * 0.018,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),

                                //Feee section

                                Container(
                                    width: width,
                                    margin: EdgeInsets.only(left: padd),
                                    height: cardSize * 0.27,
                                    decoration: BoxDecoration(
                                        color: FutTheme.primaryBg,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Fee",
                                          style: FutTheme.font3.copyWith(
                                              fontSize: height * 0.015),
                                        ),
                                        Text(
                                          '₹ ${(eventsController.selectedEvent.fees == null ? 0 : eventsController.selectedEvent.fees! / 100).toInt()}',
                                          style: FutTheme.font1.copyWith(
                                              fontSize: height * 0.018,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    )),

                                //prize

                                (eventsController.selectedEvent.prize != 0)
                                    ? Container(
                                        width: width,
                                        margin: EdgeInsets.only(left: padd),
                                        height: cardSize * 0.27,
                                        decoration: BoxDecoration(
                                            color: FutTheme.primaryBg,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Prize",
                                              style: FutTheme.font3.copyWith(
                                                  fontSize: height * 0.015),
                                            ),
                                            Text(
                                              '${eventsController.selectedEvent.prize}',
                                              style: FutTheme.font3.copyWith(
                                                fontSize: height * 0.03,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        height: cardSize * .27,
                                        width: width,
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    //Event name and venue

                    SizedBox(
                      height: height * 0.14,
                      width: width,
                      // color: Colors.red,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: height * 0.06,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                color: FutTheme.primaryBg,
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              "${eventsController.selectedEvent.dept?.title}",
                              style: FutTheme.font2
                                  .copyWith(fontSize: height * 0.015),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: height * 0.06,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                color: FutTheme.primaryBg,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
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
                                      fontSize: height * 0.015,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          )
                        ],
                      ),
                    ),

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
                            style: FutTheme.font7
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

                    SizedBox(
                      height: height * 0.05,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: width,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                          color: const Color(0xffDEFD72),
                          borderRadius: BorderRadius.circular(127)),
                      child: Text(
                        "REGISTER NOW >>",
                        style: FutTheme.font5.copyWith(
                            color: Colors.black, fontSize: height * 0.024),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                  ],
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}
