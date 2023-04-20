import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/stories/controllers/stories_controller.dart';
import 'package:story_view/story_view.dart';

class StoriesViewScreen extends StatelessWidget {
  StoriesViewScreen({super.key});
  // final controller = StoryController();
  final StoriesController storiesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => storiesController.userStoriesLoading.value
          ? const Center(child: CircularProgressIndicator())
          : StoryView(
              storyItems: storiesController.storyItems,
              controller: storiesController.controller,
              onComplete: () => storiesController.onCompleteGoToNext(),
              onVerticalSwipeComplete: (direction) {
                if (direction == Direction.down) {
                  debugPrint("Down");
                  Navigator.pop(context);
                }
              },
            ),
    );
  }
}
