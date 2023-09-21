import 'package:dressing_app/core/constants/app_photo.dart';
import 'package:dressing_app/view/widget/account_bottom_navbar_widget/account_bottom_navbar_widget.dart';
import 'package:dressing_app/view/widget/cart_bottom_navbar_widget/cart_bottom_navbat_widget.dart';
import 'package:dressing_app/view/widget/collection_bottom_nav_bar_widget/collection_bottom_navbar_widget.dart';
import 'package:dressing_app/view/widget/favorit_bottom_navbar_widget/fav_bottom_navbar_widget.dart';
import 'package:dressing_app/view/widget/home_bottom_navbar_widget/home_bottom_navbar_widget.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {}

class HomeScreenControllerIMP extends HomeScreenController {
  var screen = [
    const HomeBottomNavBarWidget(),
    const CollectionBottomNavBarWidget(),
    const FavriteBottmNavBarWidget(),
    const CartBottomNavBarWidget(),
    const AccountBottomNavBarWidget(),
  ];

  List<String> listOfIcons = [
    AppPhotoLink.homebottomNav,
    AppPhotoLink.collectionbottomnav,
    AppPhotoLink.lovebottomNav,
    AppPhotoLink.cartFill,
    AppPhotoLink.accountBottomNav,
  ];

  List<String> listOfName = [
    'home'.tr,
    'collection'.tr,
    'favorite'.tr,
    'cart'.tr,
    'account'.tr,
  ];

  var currentIndex = 0;

  changeIndex(index) {
    currentIndex = index;
    HapticFeedback.lightImpact();
    update();
  }
}
