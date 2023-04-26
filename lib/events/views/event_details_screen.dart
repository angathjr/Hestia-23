import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/auth/controllers/auth_controller.dart';
import 'package:hestia_23/core/constants..dart';
import 'package:hestia_23/core/widgets/back_button_widget.dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import 'package:hestia_23/theme/model/themes.dart';
import 'package:intl/intl.dart';
import '../controllers/event_pages_controller.dart';
import 'dart:ui' as ui;

class EventDetailsScreen extends StatelessWidget {
  EventDetailsScreen({Key? key}) : super(key: key);

  final EventsController eventsController = Get.find();
  final AuthController authController = Get.find();
  final controller = Get.put(EventPagesController());

  bool hasTextOverflow(String text, TextStyle style,
      {double minWidth = 0,
      double maxWidth = double.infinity,
      int maxLines = 2}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: ui.TextDirection.ltr,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double cardSize = (width - (2 * width * 0.04));

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.25,
                image: Themes().backgroundImage)),
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                centerTitle: false,
                pinned: false,
                floating: true,
                snap: true,
                titleSpacing: 20,
                title: GestureDetector(
                    onTap: () => Get.back(), child: const BackButtonWidget()),
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
                            child: CachedNetworkImage(
                              placeholder: (context, url) =>
                                  primaryLoadingWidget,
                              imageUrl: eventsController.selectedEvent.image ??
                                  NOIMAGE,
                              fit: BoxFit.cover,
                            )),
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
                              style: context.theme.textTheme.headlineMedium
                                  ?.copyWith(fontSize: height * 0.028),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Date",
                                    style: FutTheme.font3
                                        .copyWith(fontSize: height * 0.014),
                                  ),
                                  Text(
                                    DateFormat('MMM d').format(eventsController
                                            .selectedEvent.eventStart ??
                                        DateTime.now()),
                                    // "${eventsController.selectedEvent.eventStart?.day} / ${eventsController.selectedEvent.eventStart?.month}",
                                    style: FutTheme.font1.copyWith(
                                        fontSize: height * 0.018,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            if (eventsController.selectedEvent.prize == 0)
                              Container(
                                color: Colors.white70,
                                width: 1,
                              )
                            else
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
                                          eventsController.formatPrice(
                                              eventsController
                                                  .selectedEvent.prize),
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
                          style: context.theme.textTheme.bodyLarge?.copyWith(
                              fontSize: height * 0.023,
                              color: context.theme.primaryColor),
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
                              maxLines: controller.isReadMore.value == false
                                  ? 4
                                  : null,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.justify,
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              height: height * 0.023,
                              //  color: Colors.red,
                              child: hasTextOverflow(
                                      eventsController.selectedEvent.desc
                                          .toString(),
                                      FutTheme.font7
                                          .copyWith(fontSize: height * 0.018),
                                      maxWidth: width,
                                      maxLines: 4)
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.readMore();
                                      },
                                      child: Text(
                                        (!controller.isReadMore.value)
                                            ? "Read More "
                                            : "Read Less",
                                        style: FutTheme.font4.copyWith(
                                            color: context.theme.primaryColor),
                                      ))
                                  : null,
                            ),
                          ],
                        ),
                      ),

                      //Contact section
                      if (eventsController.selectedEvent.coordinator1 != null ||
                          eventsController.selectedEvent.coordinator2 != null)
                        Container(
                          width: width,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "CONTACT",
                            style: context.theme.textTheme.bodyLarge?.copyWith(
                                fontSize: height * 0.023,
                                color: context.theme.primaryColor),
                          ),
                        ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          if (eventsController.selectedEvent.coordinator1 !=
                              null)
                            contactDetails(
                                phoneNumber: eventsController
                                    .selectedEvent.coordinator1?.phoneNumber,
                                width,
                                height,
                                '${eventsController.selectedEvent.coordinator1?.name}'),
                          if (eventsController.selectedEvent.coordinator2 !=
                              null)
                            SizedBox(
                              width: width * 0.11,
                            ),
                          if (eventsController.selectedEvent.coordinator2 !=
                              null)
                            contactDetails(
                                phoneNumber: eventsController
                                    .selectedEvent.coordinator2?.phoneNumber,
                                width,
                                height,
                                '${eventsController.selectedEvent.coordinator2?.name}'),
                        ],
                      ),

                      SizedBox(
                        height: height * 0.05,
                      ),
                      if (!authController.isReview.value || Platform.isAndroid)
                        GestureDetector(
                          onTap: () => eventsController.launchUrlInWeb(),
                          child: Container(
                            alignment: Alignment.center,
                            width: width,
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                color: context.theme.primaryColor,
                                borderRadius: BorderRadius.circular(127)),
                            child: Text(
                              "REGISTER NOW >>",
                              style: context.theme.textTheme.bodyLarge
                                  ?.copyWith(
                                      color: Colors.black,
                                      fontSize: height * 0.024),
                            ),
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
      ),
    );
  }

  SizedBox contactDetails(double width, double height, String name,
      {String? phoneNumber}) {
    return SizedBox(
        child: GestureDetector(
      onTap: () => eventsController.launchPhoneDialer(phoneNumber),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width * 0.09,
            height: width * 0.09,
            decoration: const BoxDecoration(
                color: Color(0xffD1D1D1), shape: BoxShape.circle),
            child: Icon(
              Icons.call,
              size: width * 0.05,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: FutTheme.font4.copyWith(fontSize: height * 0.02),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    ));
  }
}
