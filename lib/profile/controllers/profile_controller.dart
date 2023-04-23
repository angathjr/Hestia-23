import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hestia_23/auth/models/user.dart';
import 'package:hestia_23/core/api_provider.dart';
import 'package:hestia_23/events/models/event.dart';

class ProfileController extends GetxController {
  final ApiProvider api = Get.find();
  final _storage = GetStorage();

  var user = (UserModel()).obs;
  var registeredEventCount = 0.obs;
  var regEventsSlug = [].obs;
  var regEvents = <EventModel>[].obs;
  var regEventsLoading=false.obs;
  

  @override
  void onInit() {
    super.onInit();
    fetchRegCount();
    _storage.listenKey('user', (value) {
      user.value = UserModel.fromJson(_storage.read('user'));
    });
    user.value = UserModel.fromJson(_storage.read('user'));
  }

  void fetchUser() async {
    final Response userResponse = await api.getApi('/api/users/');

    final UserModel userModel =
        userModelFromJson(userResponse.body['results'][0]);
    _storage.write('user', userModel.toJson());

    user.value = userModel;
  }

  void fetchRegCount() async {
    final Response response = await api.getApi("/api/events/reg/events/");

    registeredEventCount.value = response.body['count'];
  }

  Future fetchRegEventsSlugs() async {
    regEventsLoading(true);
    final Response response = await api.getApi('/api/events/reg/events/');
    final List responseBody = response.body['results'];
    List<EventModel> regEvents = [];
    for (var e in responseBody) {
      if (e['event'] != null) regEvents.add(EventModel.fromJson(e['event']));
    }
    this.regEvents.value = regEvents;
    regEventsLoading(false);
    return regEvents;
  }


 
}
