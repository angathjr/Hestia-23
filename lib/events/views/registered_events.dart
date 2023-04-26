import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hestia_23/core/widgets/back_button_widget.dart';

import '../../core/constants..dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/events_controller.dart';

class RegisteredEventScreen extends StatelessWidget {
  RegisteredEventScreen({super.key});

  final ProfileController _profileController = Get.find();
  final EventsController _eventsController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double cardHeight = height * 0.2;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Row(
                children: [
                  const BackButtonWidget(),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Registered Events",
                    style: context.theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              centerTitle: false,
              automaticallyImplyLeading: false,
              titleSpacing: 20,
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              sliver: Obx(
                () => (_profileController.regEventsLoading.value == false)
                    ? AnimationLimiter(
                        child: SliverList(
                          delegate: SliverChildBuilderDelegate(
                              childCount: _profileController.regEvents.length,
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
                                        child: GestureDetector(
                                          onTap: () {
                                            _eventsController.goToEvent(
                                                _profileController
                                                    .regEvents[index]);
                                          },
                                          child: Container(
                                            height: cardHeight,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: context
                                                      .theme.primaryColor),
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
                                                        BorderRadius.circular(
                                                            10),
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
                                                      imageUrl:
                                                          _profileController
                                                                  .regEvents[
                                                                      index]
                                                                  .image ??
                                                              NOIMAGE,
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
                                                            "${_profileController.regEvents[index].title}",
                                                            style: FutTheme
                                                                .mFont
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        width *
                                                                            0.045),
                                                            softWrap: true,
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),

                                                        //view deatils is commented here

                                                        // Container(
                                                        //   height:
                                                        //       height * 0.045,
                                                        //   margin: EdgeInsets
                                                        //       .symmetric(
                                                        //           horizontal:
                                                        //               width *
                                                        //                   0.02),
                                                        //   decoration: BoxDecoration(
                                                        //       borderRadius:
                                                        //           BorderRadius
                                                        //               .circular(
                                                        //                   20),
                                                        //       color: context
                                                        //           .theme
                                                        //           .primaryColor),
                                                        //   alignment:
                                                        //       Alignment.center,
                                                        //   child: Text(
                                                        //       "View Details",
                                                        //       style: FutTheme
                                                        //           .mFont),
                                                        // )
                                                      ],
                                                    )),
                                              )
                                            ]),
                                          ),
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
        ),
      ),
    );
  }
}
