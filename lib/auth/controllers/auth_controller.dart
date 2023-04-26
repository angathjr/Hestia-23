import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../core/api_provider.dart';
import '../../core/api_provider_no_auth.dart';
import '../models/user.dart';

class AuthController extends GetxController {
  late GoogleSignIn _googleSignIn;
  final GetStorage _storage = GetStorage();
  final ApiProvider api = Get.find();
  final ApiProviderNoAuth apiNoAuth = Get.find();
  var isSignIn = false.obs;
  var text1 = "Continue with Google".obs;
  var text2 = "Continue with Apple".obs;

  @override
  void onInit() {
    super.onInit();
    _googleSignIn = GoogleSignIn();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        Get.snackbar(
            "Network Error", "Please check your internet connectivity");
      }
    });
  }

  void signOut() async {
    await _googleSignIn.signOut();
    await _storage.erase();
    Get.offAllNamed('/login');
  }

  Future<void> googleSignIn() async {
    try {
      text1.value = "Logging you in...";
      isSignIn(true);
      final result = await _googleSignIn.signIn();
      final auth = await result!.authentication;

      Map data = {'access_token': auth.accessToken};
      final response = await apiNoAuth.postApi('/users/google/', data);
      final apiToken = response.body['key'];

      await _storage.write('authToken', apiToken);

      final Response userResponse = await api.getApi('/api/users/');

      final UserModel userModel =
          userModelFromJson(userResponse.body['results'][0]);
      _storage.write('user', userModel.toJson());

      if (userModel.isCompleted ?? false) {
        _storage.write('isComplete', true);
      } else {
        _storage.write('isComplete', false);
      }
      text1.value = "Logged in";
      isSignIn(false);
      Get.offAllNamed('/');
    } catch (error) {
      isSignIn(false);
      text1.value = "Try Again";
      await Future.delayed(const Duration(seconds: 2));
      text1.value = "Continue with Google";
    } finally {
      isSignIn(false);
      text1.value = "Continue with Google";
    }
  }

  Future<void> appleSignIn() async {
    try {
      text2.value = "Logging you in...";
      isSignIn(true);
      AuthorizationCredentialAppleID credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // final auth = await result!.authentication;
      //
      // Map data = {'access_token': auth.accessToken};
      // final response = await apiNoAuth.postApi('/users/google/', data);
      // log(data.toString());
      // final apiToken = response.body['key'];
      //
      // await _storage.write('authToken', apiToken);
      //
      // final Response userResponse = await api.getApi('/api/users/');
      //
      // final UserModel userModel =
      //     userModelFromJson(userResponse.body['results'][0]);
      // log(userModel.toString());
      // _storage.write('user', userModel.toJson());
      //
      // if (userModel.isCompleted ?? false) {
      //   _storage.write('isComplete', true);
      // } else {
      //   _storage.write('isComplete', false);
      // }
      // text2.value = "Logged in";
      // isSignIn(false);
      // Get.offAllNamed('/');
    } catch (error) {
      log(error.toString());
      isSignIn(false);
      text2.value = "Try Again";
      await Future.delayed(const Duration(seconds: 1));
      text2.value = "Continue with Apple";
    } finally {
      isSignIn(false);
      text2.value = "Continue with Apple";
    }
  }
}
