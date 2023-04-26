import 'package:get/get.dart';

import '../../core/api_provider.dart';
import '../../events/models/event.dart';

class ScheduleDate {
  final String day;
  final String date;
  final String apiDate;
  final String apiEndDate;

  ScheduleDate({required  this.apiEndDate,required this.day, required this.date, required this.apiDate});
}

class ScheduleController extends GetxController {
  final ApiProvider api = Get.find();

  var events = <EventModel>[].obs;
  var eventsLoading = false.obs;
  EventModel? selectedEvent;
  var selectedDateIndex = 0.obs;

  final List<ScheduleDate> dates = [
    ScheduleDate(date: "27", day: "Thu", apiDate: "2023-04-27", apiEndDate: '2023-04-28'),
    ScheduleDate(date: "28", day: "Fri", apiDate: "2023-04-28", apiEndDate: '2023-04-29'),
    ScheduleDate(date: "29", day: "Sat", apiDate: "2023-04-29", apiEndDate: '2023-04-30'),
    ScheduleDate(date: "30", day: "Sun", apiDate: "2023-04-30", apiEndDate: '2023-05-01'),
  ];

  @override
  void onInit() {
    super.onInit();
    fetchEventsbyDate();
  }

  void fetchEventsbyDate() async {
    eventsLoading(true);
    final Response response = await api.getApi(
        '/api/events/all/?event_start=${dates[selectedDateIndex.value].apiDate}&event_end=${dates[selectedDateIndex.value].apiEndDate}');

    List<EventModel> parsed = eventModelFromJson(response.body['results']);

    events.value = parsed;
    eventsLoading(false);
  }

  void setdate(int index) {
    selectedDateIndex.value = index;
    fetchEventsbyDate();
  }
}
