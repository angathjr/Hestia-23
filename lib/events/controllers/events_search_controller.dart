import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hestia_23/core/api_provider.dart';
import 'package:hestia_23/events/controllers/events_controller.dart';
import 'package:hestia_23/events/models/event.dart';

class EventsSearchController extends GetxController {
  final ApiProvider api = Get.find();
  final EventsController eventsController = Get.find();

  static final List<String> eventDates = [
    '-- ----',
    '27 April',
    '28 April',
    '29 April',
    '30 April'
  ];
  var date = eventDates.first.obs;

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
    date.value = eventDates.first;
    editingController = TextEditingController();
    fetchAllEvents();
  }

  void filterEvents() {
    final dept = eventsController.departments[selectedDepartmentIndex.value];
    events.value = dept.title == 'ALL'
        ? allEvents
        : RxList(
            allEvents.where((event) => event.dept?.id == dept.id).toList());
    events.value = events
        .where((element) =>
            element.title!.contains(editingController.text.toUpperCase()))
        .toList();
    if (date.value != eventDates.first) {
      events.value = RxList(events
          .where((event) =>
              event.eventStart?.day == int.parse(date.value.split(' ')[0]))
          .toList());
    }
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

  void setDate(String date) {
    this.date.value = date;
    filterEvents();
  }

  void textFieldOnChanged() => filterEvents();
}
