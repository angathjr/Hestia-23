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

  CollectionReference notificationReference =
      FirebaseFirestore.instance.collection('notifications');

  CollectionReference generalRef = FirebaseFirestore.instance
      .collection('notifications')
      .doc('groups')
      .collection('general');

  DocumentReference groups =
      FirebaseFirestore.instance.collection('notifications').doc('groups');

  late NotificationModel selectedNotificationEvent;
  var notificationsLoading = false.obs;
  var generalNotificationsLoading = false.obs;
  var generalNotifications = <NotificationModel>[].obs;
  var notifications = <NotificationModel>[].obs;
  var myEventsNotification = <NotificationModel>[].obs;
  var unseenGeneralNotificationCount = 0.obs;
  var unseenMyEventsNotificationCount = 0.obs;
  var myEventsNotificationCount = 0.obs;

  final _box = GetStorage();

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
    fetchMyEventsNotification();
    fetchGeneralNotifications();
    getUnseenMyEventsNotificationCount();
  }

  void goToNotification(NotificationModel notification) {
    selectedNotificationEvent = notification;
    Get.to(() => NotificationScreenTwo());
    fetchNotifications();
  }

  void fetchMyEventsNotification() async {
    final List<EventModel> regEvents =
        await profileController.fetchRegEventsSlugs();
    for (var event in regEvents) {
      final colRef = groups.collection('${event.slug}');
      final query =
          await colRef.orderBy('createdAt', descending: true).limit(1).get();
      final data = query.docs.map((e) => e.data()).toList();

      if (data.isNotEmpty) {
        NotificationModel notification = notificationModelFromJson(data)[0];
        notification.eventSlug = event.slug;
        notification.eventName = event.title;
        myEventsNotification.add(notification);
      }
    }

    myEventsNotification.sort(
      (a, b) => a.createdAt!.compareTo(b.createdAt!),
    );
  }

  void fetchNotifications() async {
    notificationsLoading(true);
    final colRef = groups.collection('${selectedNotificationEvent.eventSlug}');
    final query = await colRef.orderBy('createdAt', descending: true).get();
    final data = query.docs.map((e) => e.data()).toList();

    notifications.value = notificationModelFromJson(data);
    notificationsLoading(false);
  }

  void fetchRegEvents() async {
    await profileController.fetchRegEventsSlugs();
  }

  void fetchGeneralNotifications() async {
    generalNotificationsLoading(true);
    final query = await generalRef.orderBy('createdAt', descending: true).get();
    final data = query.docs.map((e) {
      dynamic map = e.data();
      map['id'] = e.id;
      return map;
    }).toList();
    generalNotifications.value = notificationModelFromJson(data);
    generalNotificationsLoading(false);
    getUnseenGeneralNotificationCount();
  }

  void getUnseenGeneralNotificationCount() {
    if (!_box.hasData('seenGeneralNotificationCount')) {
      unseenGeneralNotificationCount.value = generalNotifications.length;
    } else {
      int seenCount = _box.read('seenGeneralNotificationCount');

      if (seenCount < generalNotifications.length) {
        unseenGeneralNotificationCount.value =
            generalNotifications.length - seenCount;
      } else {
        unseenGeneralNotificationCount(0);
      }
    }
  }

  void getUnseenMyEventsNotificationCount() async {
    final List<EventModel> regEvents =
        await profileController.fetchRegEventsSlugs();

    for (var event in regEvents) {
      final colRef = groups.collection('${event.slug}');
      final query = await colRef.get();
      final data = query.docs.map((e) => e.data()).toList();
      myEventsNotificationCount.value += data.length;
    }

    if (!_box.hasData('seenMyEventsNotificationCount')) {
      unseenMyEventsNotificationCount.value = myEventsNotificationCount.value;
    } else {
      int seenCount = _box.read('seenMyEventsNotificationCount');

      if (seenCount < myEventsNotificationCount.value) {
        unseenMyEventsNotificationCount.value =
            myEventsNotificationCount.value - seenCount;
      } else {
        unseenMyEventsNotificationCount(0);
      }
    }
  }

  void seeNotifications() {
    _box.write('seenGeneralNotificationCount', generalNotifications.length);
    _box.write('seenMyEventsNotificationCount', myEventsNotificationCount);
    unseenGeneralNotificationCount(0);
    unseenMyEventsNotificationCount(0);
  }
}
