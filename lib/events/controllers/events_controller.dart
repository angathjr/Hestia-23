import 'package:get/get.dart';
import 'package:hestia_23/events/models/category.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hestia_23/events/models/department_list..dart';

import '../../core/api_provider.dart';
import '../models/event.dart';

class EventsController extends GetxController {
  final ApiProvider api = Get.find();

  final List<CategoryModel> categories = [
    // CategoryModel(code: '', name: 'All'),
    CategoryModel(
        code: 'W',
        name: 'Workshops',
        imgUrl:
            'https://firebasestorage.googleapis.com/v0/b/hestia23.appspot.com/o/HomeScreenImages%2Fworkshop.jpg?alt=media&token=c5339195-1dad-4fa7-8d02-30491781688a'),
    CategoryModel(
        code: 'T',
        name: 'Technicals',
        imgUrl:
            'https://firebasestorage.googleapis.com/v0/b/hestia23.appspot.com/o/HomeScreenImages%2Ftechnical.jpg?alt=media&token=fbdfc46f-b879-4a8d-ad44-70ff0e8c2543'),
    CategoryModel(
        code: 'PR',
        name: 'Pro Shows',
        imgUrl:
            'https://firebasestorage.googleapis.com/v0/b/hestia23.appspot.com/o/HomeScreenImages%2Fproshow.jpg?alt=media&token=59acf99c-252b-4d67-9805-e16f574e501b'),
    CategoryModel(
        code: 'G',
        name: 'General',
        imgUrl:
            'https://firebasestorage.googleapis.com/v0/b/hestia23.appspot.com/o/HomeScreenImages%2Fgeneral.jpg?alt=media&token=187031d5-3221-4b8c-a071-fbf065144a18'),
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
  }

  //TODO: fetch all dept

  void fetchDepartments() async {
    final Response response = await api.getApi('/api/events/department/all/');
    List<DepartmentModel> parsed =
        departmentModelFromJson(response.body['results']);
    departments.value = parsed;
    departments.insert(
        0, DepartmentModel(id: 0, title: 'ALL', shortForm: 'ALL', slug: 'ALL'));
    departments.removeWhere(
        (element) => element.title?.toUpperCase() == 'MERCHANDISE');
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

  String formatPrice(int price) {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    if (price > 999) {
      return '${price.toDouble() / 1000}K'.replaceAll(regex, '');
    }
    return '$price';
  }

  void launchUrlInWeb() async {
    const baseUrl = 'https://hestiatkmce.live/events';
    String category = '';
    switch (selectedEvent.eventCategory) {
      case 'T':
        category = 'technical';
        break;
      case 'G':
        category = 'general';
        break;
      case 'W':
        category = 'workshops';
        break;
      case 'PR':
        category = 'technical';
        break;
    }

    final url = '$baseUrl/$category/${selectedEvent.slug}';
    try {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      //TODO: ERROR WIDGET
    }
  }

  void launchPhoneDialer(String? phoneNumber) async {
    if (phoneNumber == null) return;
    const url = 'tel:';
    final uri = Uri.parse('tel:$phoneNumber');
    print(uri);
    try {
      await launchUrl(
        uri,
      );
    } catch (e) {
      //TODO: ERROR WIDGET
    }
  }

  // void fetchEvents() {}
}
