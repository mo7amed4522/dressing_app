// ignore_for_file: prefer_final_fields, unused_field, non_constant_identifier_names, unnecessary_overrides

import 'package:dressing_app/core/constants/constant.dart';
import 'package:dressing_app/core/constants/curd.dart';
import 'package:dressing_app/core/constants/link_api.dart';
import 'package:dressing_app/core/constants/loader.dart';
import 'package:dressing_app/core/routes/app_route.dart';
import 'package:dressing_app/model/collection_data_model.dart';
import 'package:dressing_app/model/favourite_collection_model.dart';
import 'package:dressing_app/model/love_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavorietBottomNvaBarWidgetController extends GetxController with GetSingleTickerProviderStateMixin {
  void goToProductScreen({int? prodID});
  void goToCollectionScreen(int index);
}

class FavorietBottomNvaBarWidgetControllerIMP extends FavorietBottomNvaBarWidgetController {
  Crud _crud = Crud();
  LoveModel? _loveModel;
  List<Data>? data;
  //ProductModel? _oneProductModel;
  //List<ProductData>? dataProductSingle;
  late TabController tabController;
  FavouriteCollection? _favouriteCollection;
  List<FavouritData>? favouritData;
  DataCollectionList? dataCollectionList;
  bool isLoading = false;

  @override
  void onInit() {
    fetchDataLove();
    fetchCollectionLove();
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  fetchDataLove() {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 3), () async {
      var response = await _crud.postRequest(ApiLink.intersetURL, {'user_id': user_id.toString()});
      if (response['status'] == 'success') {
        Get.back();
        isLoading = true;
        _loveModel = LoveModel.fromJson(response);
        data = _loveModel!.data;
        update();
      } else {
        Get.back();
        isLoading = true;
        update();
      }
    });
  }

  fetchCollectionLove() {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 3), () async {
      var response = await _crud.postRequest(ApiLink.getInterstCollectionURL, {'user_id': user_id.toString()});
      if (response['status'] == 'success') {
        Get.back();
        _favouriteCollection = FavouriteCollection.fromJson(response);
        favouritData = _favouriteCollection!.data;
        update();
      } else {
        Get.back();
      }
    });
  }

  @override
  goToProductScreen({int? prodID}) {
    Get.toNamed(AppRouter.productScreen, arguments: {'id_prod': prodID});
  }

  @override
  void goToCollectionScreen(int index) async {
    Loader().lottieLoader();
    int x = favouritData![index].colId!;
    var response = await _crud.postRequest(ApiLink.getOneCollectionByIDURL, {'col_id': x.toString()});
    if (response['status'] == 'success') {
      dataCollectionList = DataCollectionList.fromJson(response['data']);
      Get.back();
      Get.toNamed(AppRouter.collectionScreen, arguments: {'collectionModel': dataCollectionList});
    } else {
      Get.back();
      Get.snackbar('Error !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
    }
  }
}
