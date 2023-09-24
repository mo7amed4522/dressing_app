// ignore_for_file: prefer_final_fields, unused_field

import 'dart:convert';

import 'package:dressing_app/core/constants/constant.dart';
import 'package:dressing_app/core/constants/curd.dart';
import 'package:dressing_app/core/constants/link_api.dart';
import 'package:dressing_app/core/constants/loader.dart';
import 'package:dressing_app/core/routes/app_route.dart';
import 'package:dressing_app/core/server/serves.dart';
import 'package:dressing_app/model/collection_model.dart';
import 'package:dressing_app/model/user_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginScreenController extends GetxController {
  void goToForgetPassword();
  void goToSignUpScreen();
  void onLoginTap();
}

class LoginScreenControllerIMP extends LoginScreenController {
  List<DataOfCollection>? dataOfCollection;
  late TextEditingController emailController;
  CollectionData? collectionData;
  late TextEditingController passwordController;
  bool isShowPassword = true;
  IconData iconDate = CupertinoIcons.eye_slash_fill;
  MyServices myServices = Get.find();
  Crud _crud = Crud();
  DataUser? dataUser;

  @override
  void onInit() {
    getCollection();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  getCollection() async {
    var response = await _crud.getRequest(ApiLink.departmentURL);
    if (response['status'] == 'success') {
      collectionData = CollectionData.fromJson(response);
      dataOfCollection = collectionData!.data;
      update();
    } else {
      Get.snackbar('Error !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
      update();
    }
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
  void goToForgetPassword() {
    Get.toNamed(AppRouter.forgetPasswordScreen);
  }

  @override
  void goToSignUpScreen() {
    Get.toNamed(AppRouter.registerScreen);
  }

  @override
  void onLoginTap() {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 3), () async {
      var response = await _crud.postRequest(ApiLink.loginUrl, {
        'email': emailController.text,
        'password': passwordController.text,
      });
      if (response["status"] == "success") {
        dataUser = DataUser.fromJson(response["data"]);
        Get.back();
        await myServices.sharedPreferences.setBool('isLogin', true);
        await myServices.sharedPreferences.setString('userdata', jsonEncode(response['data']));
        user_id = dataUser!.userId;
        emailController.clear();
        passwordController.clear();
        Get.toNamed(AppRouter.homeScreen, arguments: {'dataOfCollection': dataOfCollection});
        update();
      } else {
        Get.back();
        Get.snackbar('Error !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
      }
    });
  }
}
