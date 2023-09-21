// ignore_for_file: prefer_final_fields, unused_field

import 'dart:convert';

import 'package:dressing_app/core/constants/constant.dart';
import 'package:dressing_app/core/constants/curd.dart';
import 'package:dressing_app/core/constants/link_api.dart';
import 'package:dressing_app/core/constants/loader.dart';
import 'package:dressing_app/core/server/serves.dart';
import 'package:dressing_app/model/user_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class EditProfileScreenController extends GetxController {
  void goBack();
  void editTextFormFieldTap();
  void onEditButtonClick();
}

class EditProfileScreenControllerIMP extends EditProfileScreenController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController placeController;
  late TextEditingController ageController;
  late TextEditingController confimPhonenumberController;
  bool isShowPassword = true;
  IconData iconDate = CupertinoIcons.eye_slash_fill;
  DataUser? dataUser;
  bool isEdit = false;
  Crud _crud = Crud();
  MyServices myServices = Get.find();

  @override
  void onInit() {
    dataUser = Get.arguments['DataUser'];
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    placeController = TextEditingController();
    ageController = TextEditingController();
    confimPhonenumberController = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    placeController.dispose();
    ageController.dispose();
    confimPhonenumberController.dispose();
    super.dispose();
  }

  @override
  void goBack() {
    Get.back();
  }

  changeShowPassword() {
    if (isShowPassword == true) {
      isShowPassword = false;
      iconDate = CupertinoIcons.eye_solid;
    } else {
      isShowPassword = true;
      iconDate = CupertinoIcons.eye_slash_fill;
    }
    update();
  }

  @override
  void editTextFormFieldTap() {
    isEdit = !isEdit;
    update();
  }

  void getData() {
    nameController.text = dataUser!.name!;
    emailController.text = dataUser!.email!;
    phoneController.text = dataUser!.phone!;
    placeController.text = dataUser!.place!;
    ageController.text = dataUser!.age!.toString();
    confimPhonenumberController.text = dataUser?.confirmPhone ?? '';
    update();
  }

  editProfileData() async {
    Loader().lottieLoader();
    var response = await _crud.postRequest(ApiLink.editProdileURL, {
      'user_id': user_id.toString(),
      'name': nameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'age': ageController.text,
      'place': placeController.text,
      'confirm_phone': confimPhonenumberController.text,
    });
    if (response['status'] == 'success') {
      await myServices.sharedPreferences.setString('userdata', jsonEncode(response['data']));
      Get.back();
      Get.back();
    } else {
      Get.back();
      Get.snackbar('Error !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onEditButtonClick() {
    if (isEdit == true) {
      editProfileData();
    } else {
      Get.snackbar('editerror'.tr, 'editerror2'.tr, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
