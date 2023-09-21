// ignore_for_file: prefer_final_fields, non_constant_identifier_names

import 'package:dressing_app/core/constants/curd.dart';
import 'package:dressing_app/core/constants/link_api.dart';
import 'package:dressing_app/core/constants/loader.dart';
import 'package:dressing_app/core/routes/app_route.dart';
import 'package:dressing_app/model/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordScreenController extends GetxController {
  void goBack();
  sendCode({String email, int usr_id});
}

class ForgetPasswordScreenControllerIMP extends ForgetPasswordScreenController {
  late TextEditingController emailController;
  DataUser? dataUser;
  Crud _crud = Crud();

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  void goBack() {
    Get.back();
  }

  void getUserData() async {
    Loader().lottieLoader();
    var response = await _crud.postRequest(ApiLink.getUserDataURL, {'email': emailController.text});
    if (response["status"] == "success") {
      dataUser = DataUser.fromJson(response['data']);
      Get.back();
      await sendCode(email: dataUser!.email, usr_id: dataUser!.userId);
      Get.toNamed(AppRouter.verfiyCodeScreen);
    } else {
      Get.back();
      Get.snackbar('Error !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  sendCode({String? email, int? usr_id}) {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 3), () async {
      var response = await _crud.postRequest(ApiLink.forgetPasswordURL, {
        'email': email,
        'user_id': usr_id.toString(),
      });
      if (response["status"] == "success") {
        Get.back();
        Get.snackbar('Succefully !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.back();
        Get.snackbar('Error !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
      }
    });
  }
}
