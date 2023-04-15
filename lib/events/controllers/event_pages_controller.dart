import 'package:get/get.dart';

class EventPagesController extends GetxController {

  var isReadMore = false.obs;
   void readMore() {
    isReadMore.value = !isReadMore.value;
  }
}