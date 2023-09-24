// ignore_for_file: unused_field, prefer_final_fields

import 'package:dressing_app/core/constants/curd.dart';
import 'package:dressing_app/core/constants/link_api.dart';
import 'package:dressing_app/core/constants/loader.dart';
import 'package:dressing_app/core/routes/app_route.dart';
import 'package:dressing_app/model/collection_data_model.dart';
import 'package:get/get.dart';

abstract class CollextionBottomNavBarWidgetController extends GetxController {
  void goToCollectionScreen(int index);
}

class CollextionBottomNavBarWidgetControllerIMP extends CollextionBottomNavBarWidgetController {
  CollectionDataModel? _collectionDataModel;
  List<DataCollectionList>? collectionDataModelList;
  Crud _crud = Crud();
  bool isLoading = false;

  @override
  void onInit() {
    getAllCollectionData();
    super.onInit();
  }

  getAllCollectionData() {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 2), () async {
      var response = await _crud.getRequest(ApiLink.viewCollectionURL);
      if (response['status'] == 'success') {
        _collectionDataModel = CollectionDataModel.fromJson(response);
        Get.back();
        isLoading = true;
        collectionDataModelList = _collectionDataModel!.data;
        update();
      } else {
        isLoading = true;
        update();
        Get.back();
        Get.snackbar('Error !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
      }
    });
  }
/* 
  void check() {
    if (_collectionDataModelList!.id10 == null && _collectionDataModelList!.id9 == null && _collectionDataModelList!.id8 == null && _collectionDataModelList!.id7 == null && _collectionDataModelList!.id6 == null && _collectionDataModelList!.id5 == null && _collectionDataModelList!.id4 == null && _collectionDataModelList!.id3 == null) {
      _list.addAll([_collectionDataModelList!.id1!, _collectionDataModelList!.id2!]);
    } else if (_collectionDataModelList!.id10 == null && _collectionDataModelList!.id9 == null && _collectionDataModelList!.id8 == null && _collectionDataModelList!.id7 == null && _collectionDataModelList!.id6 == null && _collectionDataModelList!.id5 == null && _collectionDataModelList!.id4 == null) {
      _list.addAll([_collectionDataModelList!.id1!, _collectionDataModelList!.id2!, _collectionDataModelList!.id3!]);
    } else if (_collectionDataModelList!.id10 == null && _collectionDataModelList!.id9 == null && _collectionDataModelList!.id8 == null && _collectionDataModelList!.id7 == null && _collectionDataModelList!.id6 == null && _collectionDataModelList!.id5 == null) {
      _list.addAll([_collectionDataModelList!.id1!, _collectionDataModelList!.id2!, _collectionDataModelList!.id3!, _collectionDataModelList!.id4!]);
    } else if (_collectionDataModelList!.id10 == null && _collectionDataModelList!.id9 == null && _collectionDataModelList!.id8 == null && _collectionDataModelList!.id7 == null && _collectionDataModelList!.id6 == null) {
      _list.addAll([_collectionDataModelList!.id1!, _collectionDataModelList!.id2!, _collectionDataModelList!.id3!, _collectionDataModelList!.id4!, _collectionDataModelList!.id5!]);
    } else if (_collectionDataModelList!.id10 == null && _collectionDataModelList!.id9 == null && _collectionDataModelList!.id8 == null && _collectionDataModelList!.id7 == null) {
      _list.addAll([_collectionDataModelList!.id1!, _collectionDataModelList!.id2!, _collectionDataModelList!.id3!, _collectionDataModelList!.id4!, _collectionDataModelList!.id5!, _collectionDataModelList!.id6!]);
    } else if (_collectionDataModelList!.id10 == null && _collectionDataModelList!.id9 == null && _collectionDataModelList!.id8 == null) {
      _list.addAll([_collectionDataModelList!.id1!, _collectionDataModelList!.id2!, _collectionDataModelList!.id3!, _collectionDataModelList!.id4!, _collectionDataModelList!.id5!, _collectionDataModelList!.id6!, _collectionDataModelList!.id7!]);
    } else if (_collectionDataModelList!.id10 == null && _collectionDataModelList!.id9 == null) {
      _list.addAll([_collectionDataModelList!.id1!, _collectionDataModelList!.id2!, _collectionDataModelList!.id3!, _collectionDataModelList!.id4!, _collectionDataModelList!.id5!, _collectionDataModelList!.id6!, _collectionDataModelList!.id7!, _collectionDataModelList!.id8!]);
    } else if (_collectionDataModelList!.id10 == null) {
      _list.addAll([_collectionDataModelList!.id1!, _collectionDataModelList!.id2!, _collectionDataModelList!.id3!, _collectionDataModelList!.id4!, _collectionDataModelList!.id5!, _collectionDataModelList!.id6!, _collectionDataModelList!.id7!, _collectionDataModelList!.id8!, _collectionDataModelList!.id9!]);
    } else {
      _list.addAll([_collectionDataModelList!.id1!, _collectionDataModelList!.id2!, _collectionDataModelList!.id3!, _collectionDataModelList!.id4!, _collectionDataModelList!.id5!, _collectionDataModelList!.id6!, _collectionDataModelList!.id7!, _collectionDataModelList!.id8!, _collectionDataModelList!.id9!, _collectionDataModelList!.id10!]);
    }
  } */

  @override
  void goToCollectionScreen(int index) {
    Get.toNamed(AppRouter.collectionScreen, arguments: {'collectionModel': collectionDataModelList![index]});
  }
}
