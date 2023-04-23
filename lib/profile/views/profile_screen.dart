import 'package:cached_network_image/cached_network_image.dart';
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
    final _size = MediaQuery.of(context).size;
    final _height = _size.height;
    final _width = _size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFILE", style: context.theme.textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.06),
        child: SizedBox(
          width: _width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromRGBO(51, 51, 51, 1),
                radius: _width / 8,
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    '${controller.user.value.profileImage}',
                  ),
                  radius: _width / 9.5,
                ),
              ),
              SizedBox(
                height: _height / 100,
              ),
              Text(
                '${controller.user.value.name}',
                style: FutTheme.font3.copyWith(
                    color: const Color.fromRGBO(153, 153, 153, 1),
                    letterSpacing: 2,
                    fontSize: _width * 0.045),
              ),
              SizedBox(
                height: _height / 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.phone_outlined,
                    color: Color.fromRGBO(153, 153, 153, 1),
                  ),
                  SizedBox(
                    width: _width / 80,
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
                height: _height / 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.mail_outline,
                    color: Color.fromRGBO(153, 153, 153, 1),
                  ),
                  SizedBox(
                    width: _width / 80,
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
                height: _height / 30,
              ),
              GestureDetector(
                onTap: () => Get.to(() => RegisteredEventScreen()),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          const Color.fromRGBO(26, 26, 26, 1).withOpacity(0.4)),
                  // width: _width - 2 * (_width / 25),
                  height: _height / 9,
                  child: Padding(
                    padding: EdgeInsets.all(_width / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Number of events \nregistered",
                          style: FutTheme.font3.copyWith(
                            letterSpacing: 1,
                            color: const Color.fromRGBO(204, 204, 204, 1),
                            fontSize: _width * 0.04,
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.registeredEventCount.value.toString(),
                            style: FutTheme.font2.copyWith(
                              fontSize: _width * 0.09,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.navigate_next_outlined,
                          color: Color.fromRGBO(222, 253, 114, 1),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _height / 35,
              ),
              Container(
                width: _width,
                height: _height / 2.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(26, 26, 26, 1).withOpacity(0.4),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: _width / 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(() => ProfileCompletion(),
                            arguments: [true]),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Color.fromRGBO(51, 51, 51, 1),
                              child: Icon(
                                Icons.edit,
                                color: Color.fromRGBO(204, 204, 204, 1),
                                size: 18,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(_width / 70),
                            ),
                            Text(
                              "Edit Profile",
                              style: FutTheme.font3.copyWith(
                                color: Colors.white,
                                fontSize: _width * 0.04,
                                fontWeight: FontWeight.w200,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color.fromRGBO(51, 51, 51, 1),
                            child: Icon(
                              Icons.document_scanner_outlined,
                              color: Color.fromRGBO(204, 204, 204, 1),
                              size: 18,
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(_width / 70)),
                          Text(
                            "Certificates",
                            style: FutTheme.font3.copyWith(
                              color: Colors.white,
                              fontSize: _width * 0.04,
                              fontWeight: FontWeight.w200,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color.fromRGBO(51, 51, 51, 1),
                            child: Icon(
                              Icons.perm_identity_outlined,
                              color: Color.fromRGBO(204, 204, 204, 1),
                              size: 18,
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(_width / 70)),
                          Text(
                            "ID Card",
                            style: FutTheme.font3.copyWith(
                              color: Colors.white,
                              fontSize: _width * 0.04,
                              fontWeight: FontWeight.w200,
                            ),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () => authController.signout(),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Color.fromRGBO(51, 51, 51, 1),
                              child: Icon(
                                Icons.logout_outlined,
                                color: Color.fromRGBO(204, 204, 204, 1),
                                size: 18,
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(_width / 70)),
                            Text(
                              "Logout",
                              style: FutTheme.font3.copyWith(
                                color: Colors.white,
                                fontSize: _width * 0.04,
                                fontWeight: FontWeight.w200,
                              ),
                            )
                          ],
                        ),
                      ),
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
