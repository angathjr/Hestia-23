import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/auth/controllers/auth_controller.dart';
import 'package:hestia_23/core/Constants..dart';
import 'package:hestia_23/animations/controllers/animation_controller.dart';
import 'package:hestia_23/events/views/registered_events.dart';
import 'package:hestia_23/profile/controllers/profile_controller.dart';
import 'package:hestia_23/profile/views/profile_completion_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final AuthController authController = Get.find();
  final ProfileController controller = Get.find();
  final AnimController anim = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFILE", style: context.theme.textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromRGBO(51, 51, 51, 1),
                radius: width / 8,
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    '${controller.user.value.profileImage}',
                  ),
                  radius: width / 9.5,
                ),
              ),
              SizedBox(
                height: height / 100,
              ),
              Text(
                '${controller.user.value.name}',
                style: FutTheme.font3.copyWith(
                    color: const Color.fromRGBO(153, 153, 153, 1),
                    letterSpacing: 2,
                    fontSize: width * 0.045),
              ),
              SizedBox(
                height: height / 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.phone_outlined,
                    color: Color.fromRGBO(153, 153, 153, 1),
                  ),
                  SizedBox(
                    width: width / 80,
                  ),
                  Text(
                    '${controller.user.value.phoneNumber?.replaceAll('+91', '')}',
                    style: FutTheme.font3.copyWith(
                      color: const Color.fromRGBO(153, 153, 153, 1),
                      letterSpacing: 2,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.mail_outline,
                    color: Color.fromRGBO(153, 153, 153, 1),
                  ),
                  SizedBox(
                    width: width / 80,
                  ),
                  Text(
                    '${controller.user.value.email}',
                    style: FutTheme.font3.copyWith(
                      color: const Color.fromRGBO(153, 153, 153, 1),
                      letterSpacing: 1,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 30,
              ),
              GestureDetector(
                onTap: () => Get.to(() => RegisteredEventScreen()),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: context.theme.cardColor.withOpacity(0.6)),
                  // width: _width - 2 * (_width / 25),
                  height: height / 9,
                  child: Padding(
                    padding: EdgeInsets.all(width / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Number of events \nregistered",
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            letterSpacing: 1,
                            color: const Color.fromRGBO(204, 204, 204, 1),
                            fontSize: width * 0.04,
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.registeredEventCount.value.toString(),
                            style: FutTheme.font2.copyWith(
                              fontSize: width * 0.09,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.navigate_next_outlined,
                          color: context.theme.primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 35,
              ),
              Container(
                width: width,
                height: height / 2.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: const Color.fromRGBO(26, 26, 26, 1).withOpacity(0.4),
                ),
                child: Padding(
                  padding: EdgeInsets.all(width * 0.015),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: width,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:
                                      context.theme.cardColor.withOpacity(0.6),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(FeatherIcons.award),
                                    SizedBox(
                                      height: width * 0.015,
                                    ),
                                    Text(
                                      "View \nCertificates",
                                      style:
                                          context.theme.textTheme.titleMedium,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.015,
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () => Get.to(
                                          () => ProfileCompletion(),
                                          arguments: [true]),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: context.theme.cardColor
                                              .withOpacity(0.6),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              FeatherIcons.edit,
                                              color: Color.fromRGBO(
                                                  153, 153, 153, 1),
                                            ),
                                            SizedBox(
                                              height: width * 0.015,
                                            ),
                                            Text(
                                              "Edit Profile",
                                              style: context
                                                  .theme.textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: width * 0.015,
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: context.theme.cardColor
                                            .withOpacity(0.6),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.qr_code,
                                            color: Color.fromRGBO(
                                                153, 153, 153, 1),
                                          ),
                                          SizedBox(
                                            height: width * 0.015,
                                          ),
                                          Text(
                                            "ID Card",
                                            style: context
                                                .theme.textTheme.titleMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: width * 0.015,
                      ),
                      Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () => authController.signout(),
                            child: Container(
                              alignment: Alignment.center,
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: context.theme.cardColor.withOpacity(0.6),
                              ),
                              child: Text(
                                "Log Out",
                                style: context.theme.textTheme.titleMedium,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
