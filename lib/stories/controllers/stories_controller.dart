import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hestia_23/auth/models/user.dart';
import 'package:hestia_23/stories/model/stories.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class StoriesController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GetStorage _getStorage = GetStorage();

  CollectionReference storiesRef =
      FirebaseFirestore.instance.collection('stories');

  final storageRef = FirebaseStorage.instance.ref();
  late Reference? imagesRef = storageRef.child('images');

  var stories = <StoryModel>[].obs;
  var storiesLoading = false.obs;
  late StoryModel selectedStory;

  @override
  void onInit() {
    super.onInit();
    fetchAllStories();
  }

  void goToStory(StoryModel story) {
    selectedStory = story;
    Get.toNamed('/story-view');
  }

  void fetchAllStories() async {
    storiesLoading(true);
    final query = await storiesRef.orderBy('createdAt', descending: true).get();
    final data = query.docs.map((e) => e.data()).toList();
    stories.value = storyModelFromJson(data);
    storiesLoading(false);
  }

  void compressImage(String uri) async {
    try {
      File imageFile = File.fromUri(Uri.parse(uri));
      final targetPath = '${imageFile.absolute.path}${DateTime.now()}.png';

      final result = await FlutterImageCompress.compressAndGetFile(
        format: CompressFormat.png,
        imageFile.absolute.path,
        targetPath,
        quality: 80,
        minHeight: 640,
        minWidth: 480,
      );

      print('image Size: ' + imageFile.lengthSync().toString());
      print('result Size: ${result?.lengthSync()}');

      uploadStory(result!.absolute.path);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void uploadStory(String uri) async {
    try {
      File imageFile = File.fromUri(Uri.parse(uri));
      final user = userModelFromJson(_getStorage.read('user'));

      final imageLocation = imagesRef?.child('${user.email}-${DateTime.now()}');

      await imageLocation?.putFile(imageFile);
      final imageUrl = await imageLocation!.getDownloadURL();
      log(imageUrl);

      // Upload to cloud firestore
      StoryModel storyModel = StoryModel(
          imageUrl: imageUrl, email: user.email, username: user.username);
      await storiesRef
          .add({...storyModel.toJson(), 'createdAt': Timestamp.now()});
      fetchAllStories();
      Get.back();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
