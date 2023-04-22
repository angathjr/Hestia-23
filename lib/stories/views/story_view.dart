import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/stories/controllers/stories_controller.dart';
import 'package:hestia_23/stories/model/stories.dart';
import 'package:story_view/story_view.dart';

class StoriesViewScreen extends StatelessWidget {
  StoriesViewScreen({super.key});
  // final controller = StoryController();
  final StoriesController storiesController = Get.find();

  String timeAgo({bool numericDates = true, required DateTime date1}) {
    final date2 = DateTime.now();
    final difference = date2.difference(date1);

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  Widget _buildProfileView(StoryModel story, DateTime createdAt) {
    return SizedBox(
      // height: 40,
      width: 300,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage("${story.userImage}"),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${story.username}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  timeAgo(date1: createdAt, numericDates: false),
                  style: const TextStyle(
                    color: Colors.white38,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => storiesController.userStoriesLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: StoryView(
                      inline: true,
                      storyItems: storiesController.storyItems,
                      onStoryShow: (value) async {
                        await Future.delayed(const Duration(milliseconds: 0));
                        storiesController.updateCurrentStoryDateTime(value);
                      },
                      controller: storiesController.controller,
                      onComplete: () => storiesController.onCompleteGoToNext(),
                      onVerticalSwipeComplete: (direction) {
                        if (direction == Direction.down) {
                          debugPrint("Down");
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                  if (storiesController.userStoriesLoading.value == false)
                    Positioned(
                      top: 80,
                      left: 20,
                      child: _buildProfileView(storiesController.selectedStory,
                          storiesController.currentStoryDateTime.value),
                    ),
                ],
              ),
      ),
    );
  }
}
