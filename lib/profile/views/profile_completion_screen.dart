import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hestia_23/auth/controllers/auth_controller.dart';

import 'package:hestia_23/core/constants..dart';
import 'package:hestia_23/profile/controllers/profile_edit_controller.dart';

class ProfileCompletion extends StatelessWidget {
  ProfileCompletion({super.key});

  final ProfileEditController profileEditController = Get.find();
  final AuthController authController = Get.find();

  Widget gap() => const SizedBox(
        height: 20,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'EDIT PROFILE',
          style: context.theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(
        () => GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                gap(),
                EditTextWidget(
                  errorText: profileEditController.nameError.value,
                  fieldLabel: 'Name',
                  hintText: 'Your name',
                  controller: profileEditController.nameController,
                ),
                gap(),
                EditTextWidget(
                  isPhone: true,
                  errorText: profileEditController.phoneNumberError.value,
                  fieldLabel: 'Phone Number',
                  hintText: 'Your phone number',
                  controller: profileEditController.phoneController,
                ),
                gap(),
                EditTextWidget(
                  errorText: profileEditController.collegeError.value,
                  fieldLabel: 'College',
                  hintText: 'Your college name',
                  controller: profileEditController.collegeController,
                ),
                gap(),
                EditTextWidget(
                  errorText: profileEditController.departmentError.value,
                  fieldLabel: 'Department',
                  hintText: 'Your department name',
                  controller: profileEditController.departmentController,
                ),
                gap(),
                gap(),
                Row(
                  children: [
                    const Spacer(),
                    if (!profileEditController.isEdit)
                      GestureDetector(
                        onTap: () => authController.signout(),
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: const Color.fromRGBO(222, 253, 114, 1),
                            ),
                            borderRadius: BorderRadius.circular(14),
                            // color: const Color.fromRGBO(222, 253, 114, 1),
                          ),
                          child: Text(
                            'Logout',
                            style: FutTheme.font3.copyWith(
                              // color: Colors.black,
                              color: const Color.fromRGBO(222, 253, 114, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    GestureDetector(
                      onTap: () => profileEditController.save(),
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          // color: Colors.transparent,
                          color: const Color.fromRGBO(222, 253, 114, 1),
                        ),
                        child: Text(
                          'Save',
                          style: FutTheme.font3.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditTextWidget extends StatelessWidget {
  EditTextWidget({
    Key? key,
    this.isPhone = false,
    required this.controller,
    required this.fieldLabel,
    required this.errorText,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String fieldLabel;
  final String errorText;
  final String hintText;
  bool isPhone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldLabel,
            style: FutTheme.font3.copyWith(
              fontSize: 16,
              color: ThemeColor.color1,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: isPhone ? TextInputType.phone : null,
            controller: controller,
            style: FutTheme.font3.copyWith(
              color: const Color.fromRGBO(153, 153, 153, 1),
            ),
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: FutTheme.primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              errorText: errorText.isEmpty ? null : errorText,
              hintText: hintText,
              hintStyle: FutTheme.font3.copyWith(
                color: const Color.fromRGBO(153, 153, 153, 1),
              ),
              contentPadding: const EdgeInsets.all(16),
              filled: true,
              fillColor: const Color.fromRGBO(41, 47, 52, 1),
              // focusColor: Color.fromRGBO(222, 253, 114, 1),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(222, 253, 114, 1),
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
