import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hestia_23/auth/controllers/auth_controller.dart';
import 'package:hestia_23/core/constants..dart';
import 'package:hestia_23/animations/controllers/animation_controller.dart';
import 'package:hestia_23/events/views/registered_events.dart';
import 'package:hestia_23/profile/controllers/profile_controller.dart';
import 'package:hestia_23/profile/views/profile_completion_screen.dart';
import 'package:hestia_23/theme/model/themes.dart';

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
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              opacity: 0.25,
              image: Themes().backgroundImage)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "PROFILE",
            style: context.theme.textTheme.titleLarge
                ?.copyWith(fontSize: width * 0.064),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: SizedBox(
            width: width,
            child: AnimationConfiguration.synchronized(
              child: FadeInAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 2500),
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
                      style: context.theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white54,
                          letterSpacing: 2,
                          fontSize: width * 0.045),
                    ),
                    SizedBox(
                      height: height / 50,
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
                            color: Colors.white54,
                            letterSpacing: 1.2,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height / 200,
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
                            color: Colors.white54,
                            letterSpacing: 1,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    Container(
                      width: width,
                      height: height / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.015),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: SlideAnimation(
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: const Duration(milliseconds: 2500),
                                verticalOffset: -20,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () =>
                                      Get.to(() => RegisteredEventScreen()),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: context.theme.cardColor
                                            .withOpacity(0.9)),
                                    // width: _width - 2 * (_width / 25),
                                    height: height / 9,
                                    child: Padding(
                                      padding: EdgeInsets.all(width / 30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 20.0,
                                              ),
                                              child: Text(
                                                "Number of events \nregistered",
                                                style: context
                                                    .theme.textTheme.bodyMedium
                                                    ?.copyWith(
                                                  fontSize: height * 0.016,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Obx(
                                              () => Text(
                                                controller.regEvents.length
                                                    .toString(),
                                                style: context
                                                    .theme.textTheme.bodyMedium
                                                    ?.copyWith(
                                                  fontSize: width * 0.09,
                                                  fontWeight: FontWeight.bold,
                                                ),
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
                              ),
                            ),
                            SizedBox(
                              height: width * 0.015,
                            ),
                            Expanded(
                              flex: 8,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: SlideAnimation(
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration:
                                          const Duration(milliseconds: 2500),
                                      horizontalOffset: -20,
                                      child: Container(
                                        width: width,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: context.theme.cardColor
                                              .withOpacity(0.9),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              FeatherIcons.award,
                                              color: Color.fromRGBO(
                                                  153, 153, 153, 1),
                                            ),
                                            SizedBox(
                                              height: width * 0.03,
                                            ),
                                            Text(
                                              "View \nCertificates",
                                              style: context
                                                  .theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                fontSize: height * 0.016,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.015,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: SlideAnimation(
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration:
                                          const Duration(milliseconds: 2500),
                                      horizontalOffset: 20,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              onTap: () => Get.to(
                                                  () => ProfileCompletion(),
                                                  arguments: [true]),
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: context.theme.cardColor
                                                      .withOpacity(0.9),
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
                                                      height: width * 0.03,
                                                    ),
                                                    Text(
                                                      "Edit Profile",
                                                      style: context.theme
                                                          .textTheme.bodyMedium
                                                          ?.copyWith(
                                                        fontSize:
                                                            height * 0.016,
                                                      ),
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
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: context.theme.cardColor
                                                    .withOpacity(0.9),
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
                                                    height: width * 0.03,
                                                  ),
                                                  Text(
                                                    "ID Card",
                                                    style: context.theme
                                                        .textTheme.bodyMedium
                                                        ?.copyWith(
                                                      fontSize: height * 0.016,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                                child: SlideAnimation(
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  duration: const Duration(milliseconds: 2500),
                                  verticalOffset: 20,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(15),
                                    // onTap: () => authController.signout(),
                                    onTap: () => Get.dialog(AlertDialog(
                                      // backgroundColor: context.theme.cardColor,
                                      title: Text(
                                        "Log Out",
                                        style: context
                                            .theme.textTheme.bodyMedium
                                            ?.copyWith(fontSize: 20),
                                      ),
                                      content: const Text(
                                          "Are you sure you want to log out?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            authController.signout();
                                            //Get.back();
                                          },
                                          child: const Text("Yes"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text("No"),
                                        ),
                                      ],
                                    )),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: context.theme.cardColor
                                            .withOpacity(0.9),
                                      ),
                                      child: Text(
                                        "Log Out",
                                        style: context
                                            .theme.textTheme.bodyMedium
                                            ?.copyWith(
                                          fontSize: height * 0.016,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
