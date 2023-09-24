// ignore_for_file: prefer_final_fields, unused_field, unused_local_variable, non_constant_identifier_names

import 'package:dressing_app/core/constants/constant.dart';
import 'package:dressing_app/core/constants/curd.dart';
import 'package:dressing_app/core/constants/link_api.dart';
import 'package:dressing_app/core/constants/loader.dart';
import 'package:dressing_app/core/routes/app_route.dart';
import 'package:dressing_app/model/love_data_model.dart';
import 'package:dressing_app/model/on_product_model.dart';
import 'package:dressing_app/view/widget/make_order_widget/bottom_sheet_widget.dart';
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
  late int id_prod;
  //DataFirstProfuctModel? productData;
  OneProductModel? _oneProductModel;
  Crud _crud = Crud();
  LoveModel? _loveModel;
  List<Data>? data;
  DataProductModel? dataProductModel;

  @override
  void onInit() {
    id_prod = Get.arguments['id_prod'];
    getProductByID();
    super.onInit();
  }

  @override
  void dispose() {
    controllerAnimation.dispose();
    super.dispose();
  }

  void getProductByID() async {
    var response = await _crud.postRequest(ApiLink.getProductByIDURL, {'prod_id': id_prod.toString()});
    if (response['status'] == 'success') {
      _oneProductModel = OneProductModel.fromJson(response);
      dataProductModel = _oneProductModel!.data;
      getLove();
      update();
    } else {
      update();
    }
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
      if (data![i].prodId! == dataProductModel!.prodId) {
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
        'prod_id': dataProductModel!.prodId.toString(),
      });
      like = true;
      update();
    } else {
      var response = await _crud.postRequest(ApiLink.deletedInterstURL, {
        'prod_id': dataProductModel!.prodId.toString(),
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
    Get.bottomSheet(BottomSheetMakeOrder(
      onBuyTap: () {
        Get.toNamed(AppRouter.makeOrderScreen, arguments: {'price': dataProductModel!.price4 == 0 ? dataProductModel!.price2 : dataProductModel!.price4});
      },
      onRentTap: () {
        Get.toNamed(AppRouter.makeOrderScreen, arguments: {'price': dataProductModel!.price3 == 0 ? dataProductModel!.price1 : dataProductModel!.price3});
      },
    ));
  }
}
