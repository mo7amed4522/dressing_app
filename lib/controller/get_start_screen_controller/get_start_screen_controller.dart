// ignore_for_file: await_only_futures

import 'dart:convert';

import 'package:dressing_app/core/constants/constant.dart';
import 'package:dressing_app/core/routes/app_route.dart';
import 'package:dressing_app/core/server/serves.dart';
import 'package:dressing_app/model/user_data_model.dart';
import 'package:get/get.dart';

abstract class GetStartScreenController extends GetxController {}

class GetStartScreenControllerIMP extends GetStartScreenController {
  MyServices myServices = Get.find();
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () async {
      if (myServices.sharedPreferences.getBool('isLogin') == true) {
        await getData();
        Get.toNamed(AppRouter.homeScreen);
      } else {
        Get.toNamed(AppRouter.loginScreen);
      }
    });
    super.onInit();
  }

  getData() async {
    await getUserData().then((value) async {
      if (value != null) {
        user_id = value.userId;
        update();
      }
    });
  }

  Future<DataUser?> getUserData() async {
    String? data = await myServices.sharedPreferences.getString('userdata');
    if (data == null || data.isEmpty) return null;
    return DataUser.fromJson(jsonDecode(data));
  }
}
