// ignore_for_file: prefer_final_fields, unused_field

import 'package:dressing_app/core/constants/curd.dart';
import 'package:dressing_app/core/constants/link_api.dart';
import 'package:dressing_app/core/constants/loader.dart';
import 'package:dressing_app/core/routes/app_route.dart';
import 'package:dressing_app/model/collection_model.dart';
import 'package:dressing_app/model/product_model.dart';
import 'package:get/get.dart';

abstract class HomeBottomNavBarWidgetController extends GetxController with GetSingleTickerProviderStateMixin {
  void goToProductScreen(int index);
}

class HomeBottomNavBarWidgetControllerIMP extends HomeBottomNavBarWidgetController {
  Crud _crud = Crud();
  List<DataOfCollection>? dataOfCollection;
  bool isLoading = false;
  CollectionData? collectionData;
  ProductModel? _productModel;
  List<ProductData>? productData;

  @override
  void onInit() {
    getCollection();
    super.onInit();
  }

  getCollection() {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 3), () async {
      var response = await _crud.getRequest(ApiLink.departmentURL);
      if (response['status'] == 'success') {
        Get.back();
        collectionData = CollectionData.fromJson(response);
        dataOfCollection = collectionData!.data;
        isLoading = true;
        getProductByID(id: dataOfCollection![0].depId);
        update();
      } else {
        Get.back();
        isLoading = false;
        Get.snackbar('Error !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
        update();
      }
    });
  }

  getProductByID({int? id}) {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 3), () async {
      var response = await _crud.postRequest(ApiLink.productURL, {'dep_ID': id.toString()});
      if (response['status'] == 'success') {
        update();
        Get.back();
        _productModel = ProductModel.fromJson(response);
        productData = _productModel!.data;
      } else {
        Get.back();
        update();
        Get.snackbar('Error !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
      }
    });
  }

  @override
  void goToProductScreen(int index) {
    Get.toNamed(AppRouter.productScreen, arguments: {'productData': productData![index]});
  }
}
