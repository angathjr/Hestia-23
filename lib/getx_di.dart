import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'auth/controllers/auth_controller.dart';
import 'events/controllers/events_controller.dart';
import 'core/api_provider.dart';
import 'core/api_provider_no_auth.dart';

class GetXDependancyInjector {
  void onInit() {
    Get.put(ApiProvider());
    Get.put(ApiProviderNoAuth());
    Get.put(AuthController());
    Get.put(GetStorage());
    Get.lazyPut(() => EventsController());
  }
}
