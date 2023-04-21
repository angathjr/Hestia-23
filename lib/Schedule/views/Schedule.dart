import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/Schedule/controller/schedule_controller.dart';
import 'package:hestia_23/core/Constants..dart';
import 'package:hestia_23/animations/controllers/animation_controller.dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import 'package:hestia_23/events/models/event.dart';
import 'package:intl/intl.dart';

class Schedule extends StatelessWidget {
  Schedule({super.key});

  final ScheduleController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    double dateContainerHeight = h * 0.1;
    double navHeight = h * 0.063;

    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
            pinned: true,
            floating: true,
            centerTitle: true,
            title: Text(
              "Schedule",
              style: FutTheme.categoryFont,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(dateContainerHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                child: Container(
                  padding: EdgeInsets.only(bottom: h * 0.006),
                  height: dateContainerHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Dates(
                          date: controller.dates[0],
                          index: 0,
                          controller: controller,
                        ),
                      ),
                      Expanded(
                        child: Dates(
                          date: controller.dates[1],
                          index: 1,
                          controller: controller,
                        ),
                      ),
                      Expanded(
                        child: Dates(
                          date: controller.dates[2],
                          index: 2,
                          controller: controller,
                        ),
                      ),
                      Expanded(
                        child: Dates(
                          date: controller.dates[3],
                          index: 3,
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        SliverPadding(
            padding: EdgeInsets.fromLTRB(
              w * 0.04,
              w * 0.04,
              w * 0.04,
              w * 0.07,
            ),
            sliver: Obx(
              () => (controller.eventsLoading.value == false)
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                      childCount: controller.events.length,
                      (context, index) {
                        return TimeLineofEvents(
                          event: controller.events[index],
                        );
                      },
                    ))
                  : SliverToBoxAdapter(
                      child: SizedBox(
                          height: h * 0.6,
                          width: w,
                          child: Center(
                            child: primaryLoadingWidget,
                          ))),
            ))
      ],
    ));
  }
}

//Full EventSchedule with Line and images
class TimeLineofEvents extends StatelessWidget {
  TimeLineofEvents({super.key, required this.event});

  final EventModel event;
  final EventsController eventsController = Get.find();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTimeLine(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('h:mm a').format(event.eventStart!),
                style: const TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              GestureDetector(
                  onTap: () => eventsController.goToEvent(event),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              event.image!,
                            ),
                            fit: BoxFit.cover,
                            opacity: 0.7),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    height: h * 0.15,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: w * 0.04),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.title ?? '',
                            style: FutTheme.font3.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: h * 0.024),
                          ),
                          Text(event.shortDesc ?? ''),
                          Text(event.venue?.title ?? '')
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}


class Dates extends StatelessWidget {
   Dates(
      {super.key,
      required this.date,
      required this.index,
      required this.controller});
  final int index;
  final ScheduleDate date;
  final ScheduleController controller;
  final AnimController anim =Get.find();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        controller.setdate(index);
        anim.start(true);
        anim.loadScheduleAnimation();
      },
      child: Obx(
        () => Container(
          margin: EdgeInsets.symmetric(horizontal: w * 0.02),
          decoration: BoxDecoration(
              color: controller.selectedDateIndex.value == index
                  ? FutTheme.primaryColor
                  : FutTheme.primaryBg,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(date.date,
                  style: FutTheme.font3.copyWith(
                      fontSize: w * 0.05,
                      fontWeight: FontWeight.w600,
                      color: controller.selectedDateIndex.value == index
                          ? Colors.black
                          : Colors.white)),
              Text(date.day,
                  style: FutTheme.font3.copyWith(
                      fontSize: w * 0.036,
                      color: controller.selectedDateIndex.value == index
                          ? Colors.black
                          : Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}

//Custom Line with circular end

class CustomTimeLine extends StatelessWidget {
  CustomTimeLine({
    super.key,
  });

  final AnimController anim = Get.find();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Obx(
      () => AnimatedContainer(
        curve: Curves.easeOutCubic,
        duration: const Duration(milliseconds: 500),
        height: (anim.start.value == false) ? h * 0.25 : 0,
        width: w * 0.09,
        child: CustomPaint(
          painter: LineCircle(),
        ),
      ),
    );
  }
}

class LineCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 3
      ..color = Colors.grey
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width / 2, size.height * 0.03), size.height * 0.03, paint);
    canvas.drawLine(Offset(size.width / 2, 2 * size.height * 0.01),
        Offset(size.width / 2, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
