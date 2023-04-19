import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hestia_23/core/api_provider.dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import 'package:hestia_23/events/models/event.dart';

class EventsSearchController extends GetxController {
  final ApiProvider api = Get.find();
  final EventsController eventsController = Get.find();

  var searchText = ''.obs;
  late TextEditingController editingController;
  var eventsLoading = false.obs;
  var allEvents = <EventModel>[].obs;
  var events = <EventModel>[].obs;
  var selectedDateIndex = 0.obs;
  var selectedDepartmentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    editingController = TextEditingController();
    fetchAllEvents();
  }

  void filterEvents() {
    final dept = eventsController.departments[selectedDepartmentIndex.value];
    events.value = dept.title == 'ALL'
        ? allEvents.value
        : RxList(
            allEvents.where((event) => event.dept?.id == dept.id).toList());
    events.value = events
        .where((element) =>
            element.title!.contains(editingController.text.toUpperCase()))
        .toList();
  }

  void fetchAllEvents() async {
    // TODO: Fetch all events
    eventsLoading(true);
    final Response response = await api.getApi('/api/events/all/');
    allEvents.value = eventModelFromJson(response.body['results']);
    events.value = allEvents.value;
    eventsLoading(false);
  }

  void setDepartmentIndex(int index) {
    selectedDepartmentIndex.value = index;
    filterEvents();
  }

  void textFieldOnChanged() => filterEvents();
}
