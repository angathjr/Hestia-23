import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../core/api_provider.dart';
import '../../core/api_provider_no_auth.dart';
import '../models/user.dart';

class AuthController extends GetxController {
  late GoogleSignIn _googleSignIn;
  final GetStorage _storage = GetStorage();
  final ApiProvider api = Get.find();
  final ApiProviderNoAuth apiNoAuth = Get.find();

  @override
  void onInit() {
    super.onInit();
    _googleSignIn = GoogleSignIn();
  }

  void signout() async {
    await _googleSignIn.signOut();
    await _storage.erase();
    Get.offAllNamed('/login');
  }

  Future<void> handleSignIn() async {
    try {
      final result = await _googleSignIn.signIn();
      final auth = await result!.authentication;

      Map data = {'access_token': auth.accessToken};
      final response = await apiNoAuth.postApi('/users/google/', data);
      log(data.toString());
      final apiToken = response.body['key'];

      print('Api Token: $apiToken');

      await _storage.write('authToken', apiToken);

      final Response userResponse = await api.getApi('/api/users/');

      final UserModel userModel =
          userModelFromJson(userResponse.body['results'][0]);
      log(userModel.toString());
      _storage.write('user', userModel.toJson());

      if (userModel.isCompleted) {
        _storage.write('isComplete', true);
      } else {
        _storage.write('isComplete', false);
      }

      Get.offAllNamed('/');
    } catch (error) {
      print(error);
    }
  }
}
