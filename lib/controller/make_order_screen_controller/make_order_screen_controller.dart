// ignore_for_file: await_only_futures, prefer_final_fields

import 'dart:convert';

import 'package:dressing_app/core/constants/constant.dart';
import 'package:dressing_app/core/constants/curd.dart';
import 'package:dressing_app/core/constants/link_api.dart';
import 'package:dressing_app/core/constants/loader.dart';
import 'package:dressing_app/core/server/serves.dart';
import 'package:dressing_app/model/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MakeOrderScreenController extends GetxController {
  void goBack();
  void onUpdateClick();
  void onOrderClick();
  void calculatePrice(int value);
}

class MakeOrderScreenControllerIMP extends MakeOrderScreenController {
  //===================== VARABILES ======================= //
  bool isExist = false;
  MyServices myServices = Get.find();
  Crud _crud = Crud();
  late int price;
  int amount = 1;
  DateTime datetime1 = DateTime.now();
  DateTime datetime2 = DateTime.now();
  //===================== TEXTEDDITINGCONTROLLER ======================= //
  late TextEditingController confirmPhoneController;
  TextEditingController amountController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  late TextEditingController date1Controller;
  late TextEditingController date2Controller;
  //===================== FOCUSNODE ======================= //
  late FocusNode confirmFocusNode;
  late FocusNode amountFocusNode;
  late FocusNode priceFocusNode;
  late FocusNode date1FocusNode;
  late FocusNode date2FocusNode;
  //===================== FOCUSNODE ERROR ======================= //
  String confirmError = '';
  String amountError = '';
  String date1Error = '';
  String date2Error = '';
  String priceErro = '';
  String phoneErro = '';
  //===================== USEER DATA ======================= //
  String nameUser = '';
  String emailUser = '';
  String phoneUser = '';
  int ageUser = 0;
  String placeUser = '';

  @override
  void onInit() {
    price = Get.arguments['price'];
    //===================== TEXTEDDITINGCONTROLLER ======================= //
    confirmPhoneController = TextEditingController();
    amountController.text = amount.toString();
    priceController.text = price.toString();
    date1Controller = TextEditingController();
    date2Controller = TextEditingController();
    //===================== FOCUSNODE ======================= //
    confirmFocusNode = FocusNode();
    amountFocusNode = FocusNode();
    priceFocusNode = FocusNode();
    date1FocusNode = FocusNode();
    date2FocusNode = FocusNode();
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    //===================== TEXTEDDITINGCONTROLLER ======================= //
    confirmPhoneController.dispose();
    amountController.dispose();
    priceController.dispose();
    date1Controller.dispose();
    date2Controller.dispose();
    //===================== FOCUSNODE ======================= //
    confirmFocusNode.unfocus();
    amountFocusNode.unfocus();
    priceFocusNode.unfocus();
    date1FocusNode.unfocus();
    date2FocusNode.unfocus();
    super.dispose();
  }

  @override
  void goBack() {
    Get.back();
  }

  void check() {
    if (confirmPhoneController.text == '') {
      isExist = true;
      update();
    } else {
      isExist = false;
      update();
    }
  }

  Future<DataUser?> getUserData() async {
    String? data = await myServices.sharedPreferences.getString('userdata');
    if (data == null || data.isEmpty) return null;
    return DataUser.fromJson(jsonDecode(data));
  }

  getData() async {
    await getUserData().then((value) async {
      if (value != null) {
        confirmPhoneController.text = value.confirmPhone ?? '';
        nameUser = value.name!;
        emailUser = value.email!;
        phoneUser = value.phone!;
        ageUser = value.age!;
        placeUser = value.place!;
        check();
        update();
      }
    });
  }

  @override
  void onUpdateClick() {
    if (isVaildUpdate()) {
      editProfileData();
      isExist = false;
      update();
    } else {
      Get.snackbar('editerror'.tr, 'error'.tr, snackPosition: SnackPosition.BOTTOM);
      update();
    }
  }

  bool isVaildUpdate() {
    int count = 0;
    if (confirmPhoneController.text == '') {
      count++;
      confirmFocusNode.requestFocus();
      confirmError = 'confError'.tr;
    } else {
      confirmFocusNode.unfocus();
    }
    return count == 0 ? true : false;
  }

  editProfileData() async {
    Loader().lottieLoader();
    var response = await _crud.postRequest(ApiLink.editProdileURL, {
      'user_id': user_id.toString(),
      'name': nameUser,
      'email': emailUser,
      'phone': phoneUser,
      'age': ageUser.toString(),
      'place': placeUser,
      'confirm_phone': confirmPhoneController.text,
    });
    if (response['status'] == 'success') {
      await myServices.sharedPreferences.setString('userdata', jsonEncode(response['data']));
      Get.back();
    } else {
      Get.back();
      Get.snackbar('Error !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onOrderClick() {
    if (isExist == true) {
      Get.snackbar('errorOrder'.tr, 'errorOrder1'.tr, snackPosition: SnackPosition.BOTTOM);
    } else {}
  }

  @override
  void calculatePrice(int value) {
    priceController.text = (value * price).toString();
    update();
  }
}
