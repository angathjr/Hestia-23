import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hestia_23/core/api_provider.dart';
import 'package:hestia_23/events/models/event.dart';

class EventsSearchController extends GetxController {
  final ApiProvider api = Get.find();

  var searchText = ''.obs;
  late TextEditingController editingController;
  var allEvents = <EventModel>[].obs;
  var events = <EventModel>[].obs;
  var selectedDateIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    editingController = TextEditingController();
  }

  void filter() {
    // TODO: filter
  }

  void fetchAllEvents() async {
    // TODO: Fetch all events
    final Response response = await api.getApi('/api/events/all/');
  }
}
