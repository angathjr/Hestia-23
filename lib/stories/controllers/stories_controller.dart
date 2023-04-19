import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hestia_23/stories/model/stories.dart';

class StoriesController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference storiesRef =
      FirebaseFirestore.instance.collection('stories');

  var stories = <StoryModel>[].obs;
  var storiesLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllStories();
  }

  void fetchAllStories() async {
    storiesLoading(true);
    final query = await storiesRef.get();
    final data = query.docs.map((e) => e.data()).toList();
    stories.value = storyModelFromJson(data);
    storiesLoading(false);
  }
}
