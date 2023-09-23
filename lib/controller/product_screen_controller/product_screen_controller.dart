// ignore_for_file: prefer_final_fields, unused_field, unused_local_variable

import 'package:dressing_app/core/constants/constant.dart';
import 'package:dressing_app/core/constants/curd.dart';
import 'package:dressing_app/core/constants/link_api.dart';
import 'package:dressing_app/core/constants/loader.dart';
import 'package:dressing_app/model/love_data_model.dart';
import 'package:dressing_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  void onLikeBtnTap();
  void goBack();
  void goToMakeOrderScreen();
}

class ProductScreenControllerIMP extends ProductScreenController {
  late final AnimationController controllerAnimation = AnimationController(duration: const Duration(milliseconds: 350), vsync: this, value: 1.0);
  bool like = false;
  DataFirstProfuctModel? productData;
  Crud _crud = Crud();
  LoveModel? _loveModel;
  List<Data>? data;

  @override
  void onInit() {
    productData = Get.arguments['productData'];
    getLove();
    super.onInit();
  }

  @override
  void dispose() {
    controllerAnimation.dispose();
    super.dispose();
  }

  getLove() async {
    Loader().lottieLoader();
    var response = await _crud.postRequest(ApiLink.intersetURL, {'user_id': user_id.toString()});
    if (response['status'] == 'success') {
      _loveModel = LoveModel.fromJson(response);
      data = _loveModel!.data;
      isLikedorNt();
      update();
      Get.back();
    } else {
      Get.back();
      update();
    }
  }

  isLikedorNt() {
    for (int i = 0; i < data!.length; i++) {
      if (data![i].prodId! == productData!.prodId) {
        like = true;
        update();
        break;
      } else {
        like = false;
        update();
      }
    }
  }

  @override
  void onLikeBtnTap() async {
    if (like == false) {
      var response = await _crud.postRequest(ApiLink.addInterstURL, {
        'user_id': user_id.toString(),
        'prod_id': productData!.prodId.toString(),
      });
      like = true;
      update();
    } else {
      var response = await _crud.postRequest(ApiLink.deletedInterstURL, {
        'prod_id': productData!.prodId.toString(),
        'user_id': user_id.toString(),
      });
      like = false;
      update();
    }
  }

  @override
  void goBack() {
    Get.back();
  }

  @override
  void goToMakeOrderScreen() {
    // Get.toNamed(AppRouter.makeOrderScreen, arguments: {'price': productData!.price3 == 0 ? productData!.price1 : productData!.price3});
  }
}
