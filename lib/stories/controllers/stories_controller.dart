import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hestia_23/stories/model/stories.dart';
import 'package:story_view/story_view.dart';

class StoriesController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference storiesRef =
      FirebaseFirestore.instance.collection('stories');

  CollectionReference userStoriesRef =
      FirebaseFirestore.instance.collection('userStories');

  final storageRef = FirebaseStorage.instance.ref();
  late Reference? imagesRef = storageRef.child('images');

  final controller = StoryController();

  var stories = <StoryModel>[].obs;
  var userStories = <StoryModel>[].obs;
  var storiesLoading = false.obs;
  var userStoriesLoading = false.obs;
  late StoryModel selectedStory;
  late int selectedStoryIndex;
  var storyItems = <StoryItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllStories();
  }

  void onCompleteGoToNext() {
    if (selectedStoryIndex < stories.length - 1) {
      selectedStoryIndex++;
      selectedStory = stories[selectedStoryIndex];
      fetchStoriesByUser();
    }
  }

  void goToStory(int index) {
    selectedStoryIndex = index;
    selectedStory = stories[index];
    Get.toNamed('/story-view');
    fetchStoriesByUser();
  }

  void fetchStoriesByUser() async {
    userStoriesLoading(true);
    final query = await storiesRef
        .where('email', isEqualTo: selectedStory.email)
        .orderBy('createdAt', descending: true)
        .get();
    final data = query.docs.map((e) => e.data()).toList();
    userStories.value = storyModelFromJson(data);
    storyItems.value = userStories
        .map(
          (e) => StoryItem.pageImage(
              url: e.imageUrl ?? '',
              controller: controller,
              caption: e.username),
        )
        .toList();
    userStoriesLoading(false);
  }

  void fetchAllStories() async {
    storiesLoading(true);
    final query =
        await userStoriesRef.orderBy('lastUploaded', descending: true).get();
    final data = query.docs.map((e) => e.data()).toList();
    stories.value = storyModelFromJson(data);
    storiesLoading(false);
  }

  // void compressImage(String uri) async {
  //   try {
  //     File imageFile = File.fromUri(Uri.parse(uri));
  //     final targetPath = '${imageFile.absolute.path}${DateTime.now()}.png';

  //     final result = await FlutterImageCompress.compressAndGetFile(
  //       format: CompressFormat.png,
  //       imageFile.absolute.path,
  //       targetPath,
  //       quality: 80,
  //       minHeight: 640,
  //       minWidth: 480,
  //     );

  //     print('image Size: ' + imageFile.lengthSync().toString());
  //     print('result Size: ${result?.lengthSync()}');

  //     uploadStory(result!.absolute.path);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  // void uploadStory(String uri) async {
  //   Get.back();
  //   try {
  //     File imageFile = File.fromUri(Uri.parse(uri));
  //     final user = userModelFromJson(_getStorage.read('user'));

  //     final imageLocation = imagesRef?.child('${user.email}-${DateTime.now()}');

  //     await imageLocation?.putFile(imageFile);
  //     final imageUrl = await imageLocation!.getDownloadURL();
  //     log(imageUrl);

  //     // Upload to cloud firestore
  //     StoryModel storyModel = StoryModel(
  //         imageUrl: imageUrl, email: user.email, username: user.username);
  //     await storiesRef
  //         .add({...storyModel.toJson(), 'createdAt': Timestamp.now()});

  //     await userStoriesRef
  //         .doc(user.email)
  //         .set({...storyModel.toJson(), 'lastUploaded': Timestamp.now()});

  //     fetchAllStories();
  //     Get.snackbar(
  //       'Story Uploaded',
  //       'Successful',
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
}
