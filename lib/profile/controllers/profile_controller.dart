import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hestia_23/auth/models/user.dart';
import 'package:hestia_23/core/api_provider.dart';

class ProfileController extends GetxController {
  final ApiProvider api = Get.find();
  final _storage = GetStorage();

  late UserModel user;

  @override
  void onInit() {
    super.onInit();
    user = UserModel.fromJson(_storage.read('user'));
  }

  void fetchUser() async {
    final Response userResponse = await api.getApi('/api/users/');

    final UserModel userModel =
        userModelFromJson(userResponse.body['results'][0]);
    _storage.write('user', userModel.toJson());

    user = userModel;
  }
}
