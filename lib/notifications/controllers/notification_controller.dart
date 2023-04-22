import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hestia_23/events/models/event.dart';
import 'package:hestia_23/notifications/models/notification.dart';
import 'package:hestia_23/notifications/views/notification_screen_two.dart';
import 'package:hestia_23/profile/controllers/profile_controller.dart';

class NotificationController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final ProfileController profileController = Get.find();

  CollectionReference notfRef =
      FirebaseFirestore.instance.collection('notifications');

  CollectionReference generealRef = FirebaseFirestore.instance
      .collection('notifications')
      .doc('groups')
      .collection('general');

  DocumentReference groups =
      FirebaseFirestore.instance.collection('notifications').doc('groups');

  late EventModel selectedNotEvent;
  var notificationsLoading = false.obs;
  var generalNotificationsLoading = false.obs;
  var generalNotifications = <NotificationModel>[].obs;
  var notifications = <NotificationModel>[].obs;

  ///notifications/groups/CUSTOM-EVENT-FOR-APP-TEST/M5gZdjPQ6ktaPMbc6mlg

  // void fetchAllStories() async {
  //   storiesLoading(true);
  //   final query = await storiesRef.orderBy('createdAt', descending: true).get();
  //   final data = query.docs.map((e) => e.data()).toList();
  //   stories.value = storyModelFromJson(data);
  //   storiesLoading(false);
  // }

  @override
  void onInit() {
    super.onInit();
    fetchRegEvents();
    fetchGeneralNotifications();
  }

  void goToNotification(EventModel event) {
    selectedNotEvent = event;
    Get.to(() => NotificationScreenTwo());
    fetchNotifications();
  }

  void fetchNotifications() async {
    notificationsLoading(true);
    final colRef = groups.collection('${selectedNotEvent.slug}');
    final query = await colRef.orderBy('createdAt', descending: true).get();
    final data = query.docs.map((e) => e.data()).toList();

    notifications.value = notificationModelFromJson(data);
    notificationsLoading(false);
  }

  void fetchRegEvents() async {
    print(await profileController.fetchRegEventsSlugs());
  }

  void fetchGeneralNotifications() async {
    generalNotificationsLoading(true);
    final query =
        await generealRef.orderBy('createdAt', descending: true).get();
    final data = query.docs.map((e) => e.data()).toList();
    generalNotifications.value = notificationModelFromJson(data);
    generalNotificationsLoading(false);
  }
}
