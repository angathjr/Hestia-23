import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/stories/controllers/stories_controller.dart';
import 'package:story_view/story_view.dart';

class StoriesViewScreen extends StatelessWidget {
  StoriesViewScreen({super.key});
  final controller = StoryController();
  final StoriesController storiesController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<StoryItem> storyItems = [];
    final selectedStory = storiesController.selectedStory;
    StoryItem item = StoryItem.pageImage(
        caption: selectedStory.username,
        url: selectedStory.imageUrl ?? '',
        controller: controller);
    storyItems.add(item);

    return StoryView(
      storyItems: storyItems,
      controller: controller,
      onVerticalSwipeComplete: (direction) {
        if (direction == Direction.down) {
          debugPrint("Down");
          Navigator.pop(context);
        }
      },
    );
  }
}
