import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hestia_23/events/controllers/events_search_controller.dart';
import 'package:hestia_23/fcm/controllers/fcm_controller.dart';
import 'package:hestia_23/Schedule/controller/schedule_controller.dart';
import 'package:hestia_23/navbar/controllers/navbar_controller.dart';
import 'package:hestia_23/notifications/controllers/notification_controller.dart';
import 'package:hestia_23/profile/controllers/profile_controller.dart';
import 'package:hestia_23/profile/controllers/profile_edit_controller.dart';
import 'package:hestia_23/stories/controllers/stories_controller.dart';
import 'auth/controllers/auth_controller.dart';
import 'animations/controllers/animation_controller.dart';
import 'events/controllers/events_controller.dart';
import 'core/api_provider.dart';
import 'core/api_provider_no_auth.dart';

class GetXDependancyInjector {
  void onInit() {
    Get.put(ApiProvider());
    Get.put(ApiProviderNoAuth());
    Get.put(AuthController());
    Get.put(GetStorage());
    Get.lazyPut(() => FCMController(), fenix: true);
    Get.lazyPut(() => EventsController(), fenix: true);
    Get.lazyPut(() => ProfileEditController(), fenix: true);
    Get.lazyPut(() => ScheduleController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => EventsSearchController(), fenix: true);
    Get.lazyPut(() => StoriesController(), fenix: true);
    Get.lazyPut(() => AnimController(), fenix: true);
    Get.lazyPut(() => NavBarController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
   
  }
}
