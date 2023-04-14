import 'package:get/get.dart';

import '../core/api_provider.dart';
import '../models/event.dart';

class EventsController extends GetxController {
  final ApiProvider api = Get.find();

  var events = <EventModel>[].obs;
  var eventsLoading = false.obs;
  var selectedEventIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();

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

  // TODO: IMPLEMENTATION
  void fetchAttendance() async {}

  // TODO: IMPLEMENTATION
  void markAttendance() async {}

  // TODO: IMPLEMENTATION
  void markWinners() async {}
}
