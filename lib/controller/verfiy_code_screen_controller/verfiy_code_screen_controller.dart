// ignore_for_file: prefer_final_fields, unused_field, unused_local_variable, avoid_print

import 'package:dressing_app/core/constants/curd.dart';
import 'package:dressing_app/core/constants/link_api.dart';
import 'package:dressing_app/core/constants/loader.dart';
import 'package:dressing_app/core/routes/app_route.dart';
import 'package:get/get.dart';

abstract class VerfiyCodeScreenController extends GetxController {
  void verfiyCode(String otp);
  void goBack();
  updateTypeUser();
}

class VerfiyCodeScreenControllerIMP extends VerfiyCodeScreenController {
  late String email;
  Crud _crud = Crud();
  String? verfiyCodeOtp;
  int? userID;

  @override
  void onInit() {
    email = Get.arguments['email'];
    userID = Get.arguments['user_id'];
    super.onInit();
  }

  @override
  void verfiyCode(String otp) {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 3), () async {
      var response = await _crud.postRequest(ApiLink.verfiyCodeURL, {
        'email': email,
        'verfiyCode': otp,
      });
      print(email + otp);
      if (response["status"] == "success") {
        Get.back();
        Get.snackbar('Succefully !!', response['msg'],
            snackPosition: SnackPosition.BOTTOM);
        await updateTypeUser();
        Get.toNamed(AppRouter.loginScreen);
      } else {
        Get.back();
        Get.snackbar('Error !! here', response['msg'],
            snackPosition: SnackPosition.BOTTOM);
      }
    });
  }

  @override
  void goBack() {
    Get.back();
  }

  @override
  updateTypeUser() async {
    var response = await _crud.postRequest(ApiLink.updateUsersType, {
      'user_id': userID.toString(),
    });
  }
}
