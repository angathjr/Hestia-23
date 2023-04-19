
import 'package:get/get.dart';
import 'package:hestia_23/events/models/category.dart';
import 'package:hestia_23/events/models/department_list..dart';

import '../../core/api_provider.dart';
import '../models/event.dart';

class EventsController extends GetxController {
  final ApiProvider api = Get.find();

  final List<CategoryModel> categories = [
    // CategoryModel(code: '', name: 'All'),
    CategoryModel(code: 'W', name: 'Workshops'),
    CategoryModel(code: 'T', name: 'Technicals'),
    CategoryModel(code: 'PR', name: 'Pro Shows'),
    CategoryModel(code: 'G', name: 'General'),
    // CategoryModel(code: 'W', name: 'Workshops'),
  ];

  var events = <EventModel>[].obs;
  var allEvents = <EventModel>[].obs;
  var eventsLoading = false.obs;
  var departmentLoading = false.obs;
  late EventModel selectedEvent;
  var departments = <DepartmentModel>[].obs;
  late CategoryModel selectedCategory;
  var selectedDepartmentIndex = 0.obs;

  static final List<String> eventDates = [
    '-- April',
    '27 April',
    '28 April',
    '29 April',
    '30 April'
  ];
  var date = eventDates.first.obs;

  @override
  void onReady() {
    super.onReady();
    selectedCategory = categories[0];

    fetchDepartments();
  }


  void fetchEvents() async {
    eventsLoading(true);
    setDepartmentIndex(0);
    date.value = eventDates.first;
    final Response response = await api
        .getApi('/api/events/all/?event_category=${selectedCategory.code}');

    List<EventModel> parsed = eventModelFromJson(response.body['results']);

    // parsed.forEach((element) => print(element.slug));
    events.value = parsed;
    allEvents.value = parsed;

    eventsLoading(false);
  }

  void filterEvents() {
    final dept = departments.value[selectedDepartmentIndex.value];
    events.value = dept.title == 'ALL'
        ? allEvents.value
        : RxList(
            allEvents.where((event) => event.dept?.id == dept.id).toList());

    if (date.value != eventDates.first) {
      events.value = RxList(events
          .where((event) =>
              event.eventStart?.day == int.parse(date.value.split(' ')[0]))
          .toList());
    }

    print(events.value);
  }

  //TODO: fetch all dept
  void fetchDepartments() async {
    final Response response = await api.getApi('/api/events/department/all/');
    List<DepartmentModel> parsed =
        departmentModelFromJson(response.body['results']);
    departments.value = parsed;
    departments.value.insert(
        0, DepartmentModel(id: 0, title: 'ALL', shortForm: 'ALL', slug: 'ALL'));
    setDepartmentIndex(0);
    departmentLoading(true);
  }

  void setDepartmentIndex(int index) {
    selectedDepartmentIndex.value = index;
    filterEvents();
  }

  void goToEvent(EventModel event) {
    selectedEvent = event;
    Get.toNamed('/event');
  }

  void setDate(String date) {
    this.date.value = date;
    filterEvents();
  }

  // void fetchEvents() {}
}
