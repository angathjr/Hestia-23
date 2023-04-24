// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hestia_23/stories/controllers/stories_controller.dart';
import 'package:hestia_23/stories/model/stories.dart';
import 'package:hestia_23/theme/controllers/theme_controller.dart';

class Stories extends StatelessWidget {
  Stories({super.key});

  final StoriesController controller = Get.find();
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: width / 20,
            ),
            Text(
              themeController.selectedIndex.value == 0
                  ? "MEMORIES"
                  : themeController.selectedIndex.value == 1
                      ? "STORIES"
                      : "HIGHLIGHTS",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: height * 0.022),
            ),
            SizedBox(
              height: height / 20,
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: themeController.selectedIndex.value == 1
              ? height / 7.5
              : height / 6.5,
          child: Obx(
            () => AnimationLimiter(
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.stories.length,
                itemBuilder: (context, index) {
                  // if (index == 0) {
                  //   return GestureDetector(
                  //     onTap: () {
                  //       Get.to(
                  //         StoriesEditor(
                  //           giphyKey: "RvvTK8aN4SOt6rLKzpx9uVrq9tLFBWyv",
                  //           onDone: (uri) {
                  //             debugPrint(uri);

                  //             //! Compress Image
                  //             controller.compressImage(uri);
                  //           },
                  //           middleBottomWidget: Text(
                  //             "Hestia",
                  //             style: FutTheme.font1
                  //                 .copyWith(fontSize: _width * 0.09),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //     child: Padding(
                  //       padding: EdgeInsets.all(_width * 0.01),
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           color: Colors.grey[800],
                  //           borderRadius: BorderRadius.circular(15),
                  //         ),
                  //         width: _width / 3.8,
                  //         height: _height / 5.5,
                  //         child: const Icon(
                  //           Icons.add,
                  //           size: 50,
                  //         ),
                  //       ),
                  //     ),
                  //   );
                  // }

                  // index = index - 1;
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 100),
                    child: SlideAnimation(
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: const Duration(milliseconds: 1500),
                      horizontalOffset: -50,
                      child: FadeInAnimation(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: const Duration(milliseconds: 1500),
                        child: StoriesCard(
                          index: index,
                          story: controller.stories[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class StoriesCard extends StatelessWidget {
  StoriesCard({
    Key? key,
    required this.story,
    required this.index,
  }) : super(key: key);

  final StoryModel story;
  final int index;
  final StoriesController controller = Get.find();
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.015,
        right: width * 0.015,
        bottom: height * 0.005,
        top: height * 0.005,
      ),
      child: GestureDetector(
        onTap: () => controller.goToStory(index),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${story.imageUrl}'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.grey[800],
                  border: themeController.selectedIndex.value == 1
                      ? Border.all(color: context.theme.primaryColor)
                      : null,
                  borderRadius: themeController.selectedIndex.value == 0
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(5),
                        )
                      : themeController.selectedIndex.value == 1
                          ? BorderRadius.circular(100)
                          : BorderRadius.circular(5),
                ),
                width: themeController.selectedIndex.value == 1
                    ? width / 5
                    : width / 3.8,
                height: themeController.selectedIndex.value == 1
                    ? height / 11
                    : height / 5.5,
              ),
            ),
            Positioned(
              top: themeController.selectedIndex.value == 2 ? 0 : null,
              bottom: themeController.selectedIndex.value == 1 ? 0 : 10,
              width: themeController.selectedIndex.value == 1
                  ? width / 5
                  : width / 3.8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${story.username}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: themeController.selectedIndex.value == 1
                      ? TextAlign.center
                      : TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
