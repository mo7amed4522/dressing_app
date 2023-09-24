// ignore_for_file: prefer_final_fields, unused_field, list_remove_unrelated_type, iterable_contains_unrelated_type

import 'package:dressing_app/core/constants/constant.dart';
import 'package:dressing_app/core/constants/curd.dart';
import 'package:dressing_app/core/constants/link_api.dart';
import 'package:dressing_app/core/constants/loader.dart';
import 'package:dressing_app/model/order_rant_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartBottomNavBarWidgetController extends GetxController with GetSingleTickerProviderStateMixin {}

class CartBottomNavBarWidgetControllerIMP extends CartBottomNavBarWidgetController {
  OrderRentModel? _orderRentModel;
  List<DataOrderRentModel>? _dataOrderRentModel;
  List<DataOrderRentModel> dataOrderRentModel = [];
  List<DataOrderRentModel> dataCollectionModel = [];
  Crud _crud = Crud();
  late TabController tabController;
  bool isLoading = false;

  @override
  void onInit() {
    getDataOrder();
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  checkOrder() async {
    for (int i = 0; i < _dataOrderRentModel!.length; i++) {
      if (_dataOrderRentModel![i].prodID == null) {
        dataCollectionModel.addAll([_dataOrderRentModel![i]]);
      } else {
        dataOrderRentModel.addAll([_dataOrderRentModel![i]]);
      }
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  getDataOrder() {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 2), () async {
      var response = await _crud.postRequest(ApiLink.getOrderUserByID, {'user_ID': user_id.toString()});
      if (response['status'] == 'success') {
        _orderRentModel = OrderRentModel.fromJson(response);
        _dataOrderRentModel = _orderRentModel!.data;
        isLoading = true;
        await checkOrder();
        Get.back();
        update();
      } else {
        Get.back();
        isLoading = true;
        Get.snackbar('Error !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
        update();
      }
    });
  }
}
