// ignore_for_file: prefer_final_fields, unused_field

import 'package:dressing_app/core/constants/curd.dart';
import 'package:dressing_app/core/constants/link_api.dart';
import 'package:dressing_app/core/constants/loader.dart';
import 'package:dressing_app/core/routes/app_route.dart';
import 'package:dressing_app/core/server/serves.dart';
import 'package:dressing_app/model/user_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class RegisterScreenController extends GetxController {
  void goBack();
  void registerNewAccount();
}

class RegisterScreenControllerIMP extends RegisterScreenController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController placeController;
  late TextEditingController ageController;
  bool isShowPassword = true;
  IconData iconDate = CupertinoIcons.eye_slash_fill;
  MyServices myServices = Get.find();
  Crud crud = Crud();
  DataUser? dataUser;
  DataUser? _dataUser;

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    placeController = TextEditingController();
    ageController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    placeController.dispose();
    ageController.dispose();
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
  void registerNewAccount() async {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 3), () async {
      var response = await crud.postRequest(ApiLink.registerUrl, {
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'phone': phoneController.text,
        'age': ageController.text,
        'place': placeController.text,
        'type': '0',
      });
      if (response["status"] == "success") {
        Get.back();
        _dataUser = DataUser.fromJson(response['data']);
        Get.snackbar('Successfully !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
        Get.toNamed(AppRouter.verfiyCodeScreen, arguments: {
          'email': emailController.text,
          'user_id': _dataUser!.userId,
        });
      } else {
        Get.back();
        Get.snackbar('Error !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
      }
    });
  }
}
