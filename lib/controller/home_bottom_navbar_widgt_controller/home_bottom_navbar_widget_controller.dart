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
  FirstProductModel? _productModel;
  List<DataFirstProfuctModel>? productData;

  bool isLoading = false;

  @override
  void onInit() {
    dataOfCollection = Get.arguments['dataOfCollection'];
    getProductByID(id: dataOfCollection![0].depId);
    super.onInit();
  }

  getProductByID({int? id}) {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 3), () async {
      var response = await _crud.postRequest(ApiLink.productURL, {'dep_ID': id.toString()});
      if (response['status'] == 'success') {
        isLoading = true;
        update();
        Get.back();
        _productModel = FirstProductModel.fromJson(response);
        productData = _productModel!.data;
      } else {
        isLoading = true;
        Get.back();
        update();
        Get.snackbar('Error !!', response['msg'], snackPosition: SnackPosition.BOTTOM);
      }
    });
  }

  @override
  void goToProductScreen(int index) {
    Get.toNamed(AppRouter.productScreen, arguments: {'id_prod': index});
  }
}
