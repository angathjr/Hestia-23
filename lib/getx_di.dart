import 'package:get/get.dart';

import 'core/api_provider.dart';

class GetXDependancyInjector {
  void onInit() {
    Get.put(ApiProvider());
  }
}
