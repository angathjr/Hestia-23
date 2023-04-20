// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stories_editor/stories_editor.dart';

import 'package:hestia_23/core/Constants..dart';
import 'package:hestia_23/stories/controllers/stories_controller.dart';
import 'package:hestia_23/stories/model/stories.dart';
import 'package:hestia_23/stories/views/story_view.dart';

class Stories extends StatelessWidget {
  Stories({super.key});

  final StoriesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _height = _size.height;
    final _width = _size.width;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: _width / 20,
            ),
            Text(
              "STORIES",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: _height / 6.5,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: controller.stories.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        StoriesEditor(
                          giphyKey: "RvvTK8aN4SOt6rLKzpx9uVrq9tLFBWyv",
                          onDone: (uri) {
                            debugPrint(uri);

                            //! Compress Image
                            controller.compressImage(uri);
                          },
                          middleBottomWidget: Text(
                            "Hestia",
                            style: FutTheme.font1
                                .copyWith(fontSize: _width * 0.09),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(_width * 0.01),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: _width / 3.8,
                        height: _height / 5.5,
                        child: const Icon(
                          Icons.add,
                          size: 50,
                        ),
                      ),
                    ),
                  );
                } else {
                  index = index - 1;
                  return StoriesCard(
                    story: controller.stories[index],
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class StoriesCard extends StatelessWidget {
  const StoriesCard({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryModel story;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _height = _size.height;
    final _width = _size.width;
    return Padding(
      padding: EdgeInsets.all(_width * 0.01),
      child: GestureDetector(
        onTap: () {
          Get.to(
            StoriesViewScreen(),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('${story.imageUrl}'),
              fit: BoxFit.cover,
            ),
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(15),
          ),
          width: _width / 3.8,
          height: _height / 5.5,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                "${story.username}",
                style: TextStyle(
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
