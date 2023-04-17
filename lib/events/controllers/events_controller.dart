import 'package:get/get.dart';
import 'package:hestia_23/events/models/department_list..dart';

import '../../core/api_provider.dart';
import '../models/event.dart';

class EventsController extends GetxController {
  final ApiProvider api = Get.find();

  var events = <EventModel>[].obs;
  var eventsLoading = false.obs;
  var departmentLoading = false.obs;
  var selectedEventIndex = 0.obs;
  var departments = <DepartmentModel>[].obs;
  static final List<String> eventDates = [
    '27 April',
    '28 April',
    '29 April',
    '30 April'
  ];
  var date = eventDates.first.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDepartments();
    fetchEvents();
  }

  void fetchEvents() async {
    eventsLoading(true);
    final Response response = await api.getApi('/api/events/all/');

    List<EventModel> parsed = eventModelFromJson(response.body['results']);

    parsed.forEach((element) => print(element.slug));
    events.value = parsed;
    eventsLoading(false);
  }

  //TODO: fetch all dept
  void fetchDepartments() async {
    final Response response = await api.getApi('/api/events/department/all/');
    List<DepartmentModel> parsed =
        departmentModelFromJson(response.body['results']);
    departments.value = parsed;
    departmentLoading(true);
  }

  // TODO: IMPLEMENTATION
  void fetchAttendance() async {}

  // TODO: IMPLEMENTATION
  void markAttendance() async {}

  // TODO: IMPLEMENTATION
  void markWinners() async {}
}
