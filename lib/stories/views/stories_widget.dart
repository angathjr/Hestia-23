// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'package:hestia_23/stories/controllers/stories_controller.dart';
import 'package:hestia_23/stories/model/stories.dart';

class Stories extends StatelessWidget {
  Stories({super.key});

  final StoriesController controller = Get.find();

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
              "HIGHLIGHTS",
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
          height: height / 6.5,
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Padding(
      padding: EdgeInsets.all(width * 0.01),
      child: GestureDetector(
        onTap: () => controller.goToStory(index),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('${story.imageUrl}'),
              fit: BoxFit.cover,
            ),
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(15),
          ),
          width: width / 3.8,
          height: height / 5.5,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "${story.username}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
