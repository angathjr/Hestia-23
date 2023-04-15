import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hestia_23/auth/controllers/auth_controller.dart';
import 'package:hestia_23/auth/models/user.dart';
import 'package:hestia_23/core/api_provider.dart';

class ProfileEditController extends GetxController {
  final _storage = GetStorage();
  final ApiProvider api = Get.find();

  var name = ''.obs;
  var phoneNumber = ''.obs;
  var college = ''.obs;
  var department = ''.obs;
  late UserModel user;

  var nameError = ''.obs;
  var phoneNumberError = ''.obs;
  var collegeError = ''.obs;
  var departmentError = ''.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController departmentController = TextEditingController();

  void save() async {
    if (nameController.text.isEmpty) {
      nameError.value = 'Must not be empty';
      return;
    } else {
      nameError.value = '';
    }

    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (phoneController.text.trim().isEmpty) {
      phoneNumberError.value = 'Please enter mobile number';
      return;
    } else if (phoneController.text.trim().length > 10) {
      phoneNumberError.value = 'Please enter valid mobile number';
      return;
    } else if (!regExp.hasMatch(phoneController.text.trim())) {
      phoneNumberError.value = 'Please enter valid mobile number';
      return;
    } else {
      phoneNumberError.value = '';
    }

    if (collegeController.text.trim().isEmpty) {
      collegeError.value = 'Must not be empty';
      return;
    } else {
      collegeError.value = '';
    }
    if (departmentController.text.trim().isEmpty) {
      departmentError.value = 'Must not be empty';
      return;
    } else {
      departmentError.value = '';
    }

    //! API INTEGRATION
    user = user.copyWith(
        phoneNumber: '+91${phoneController.text.trim()}',
        name: nameController.text.trim(),
        collegeName: collegeController.text.trim(),
        deptName: departmentController.text.trim(),
        isCompleted: true);

    final response =
        await api.putApi('/api/users/${user.username}/', user.toJson());

    if (response.statusCode == 200) {
      await _storage.write('user', user.toJson());
      await _storage.write('isComplete', true);
      print(_storage.read('isComplete'));
      Get.offAllNamed('/');
    } else {
      Get.snackbar(
        'Error has occured',
        '${response.body}',
        colorText: Colors.white,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();

    user = userModelFromJson(_storage.read('user'));
    nameController = TextEditingController(text: user.name);
    phoneController = TextEditingController(text: user.phoneNumber);
    collegeController = TextEditingController(text: user.collegeName);
    departmentController = TextEditingController(text: user.deptName);
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    collegeController.dispose();
    departmentController.dispose();
    super.onClose();
  }
}
