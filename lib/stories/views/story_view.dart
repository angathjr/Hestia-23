import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

class StoriesViewScreen extends StatelessWidget {
  StoriesViewScreen({super.key});
  final controller = StoryController();

  @override
  Widget build(BuildContext context) {
    List<StoryItem> storyItems = [
      StoryItem.pageImage(
          url:
              "https://media.wired.com/photos/598e35fb99d76447c4eb1f28/16:9/w_2123,h_1194,c_limit/phonepicutres-TA.jpg",
          controller: controller),
      StoryItem.pageImage(
          url:
              "https://media.wired.com/photos/598e35fb99d76447c4eb1f28/16:9/w_2123,h_1194,c_limit/phonepicutres-TA.jpg",
          controller: controller),
      StoryItem.pageImage(
          url:
              "https://media.wired.com/photos/598e35fb99d76447c4eb1f28/16:9/w_2123,h_1194,c_limit/phonepicutres-TA.jpg",
          controller: controller)
    ];
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
