// ignore_for_file: prefer_final_fields, unused_field, unused_local_variable

import 'package:dressing_app/core/constants/constant.dart';
import 'package:dressing_app/core/constants/curd.dart';
import 'package:dressing_app/core/constants/link_api.dart';
import 'package:dressing_app/core/constants/loader.dart';
import 'package:dressing_app/model/collection_data_model.dart';
import 'package:dressing_app/model/favourite_collection_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CollectionScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  void onLikeBtnTap();
  void goBack();
}

class CollectionScreenControllerIMP extends CollectionScreenController {
  late final AnimationController controllerAnimation = AnimationController(duration: const Duration(milliseconds: 350), vsync: this, value: 1.0);
  DataCollectionList? dataCollectionList;
  bool like = false;
  Crud _crud = Crud();
  FavouriteCollection? _favouriteCollection;
  List<FavouritData>? favouritData;

  @override
  void onInit() {
    dataCollectionList = Get.arguments['collectionModel'];
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
    var response = await _crud.postRequest(ApiLink.getInterstCollectionURL, {'user_id': user_id.toString()});
    if (response['status'] == 'success') {
      _favouriteCollection = FavouriteCollection.fromJson(response);
      favouritData = _favouriteCollection!.data;
      isLikeOrNot();
      update();
      Get.back();
    } else {
      Get.back();
      update();
    }
  }

  isLikeOrNot() {
    for (int i = 0; i < favouritData!.length; i++) {
      if (favouritData![i].colId == dataCollectionList!.colId) {
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
      var response = await _crud.postRequest(ApiLink.addInterstCollectionURL, {
        'user_id': user_id.toString(),
        'collection_id': dataCollectionList!.colId.toString(),
      });
      like = true;
      update();
    } else {
      var response = await _crud.postRequest(ApiLink.deletedInterstColletionURL, {
        'collection_id': dataCollectionList!.colId.toString(),
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
}
