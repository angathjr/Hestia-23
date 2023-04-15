import 'package:get/get.dart';

class DetailPageController extends GetxController {
  var isReadMore = false.obs;

  void readMore() {
    isReadMore.value = !isReadMore.value;
  }
}