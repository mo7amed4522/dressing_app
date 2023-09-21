// ignore_for_file: await_only_futures

import 'dart:convert';

import 'package:dressing_app/core/constants/link_api.dart';
import 'package:dressing_app/core/constants/loader.dart';
import 'package:dressing_app/core/routes/app_route.dart';
import 'package:dressing_app/core/server/serves.dart';
import 'package:dressing_app/model/user_data_model.dart';
import 'package:dressing_app/view/widget/account_bottom_navbar_widget/widget/bottom_sheet_theme_widget.dart';
import 'package:dressing_app/view/widget/account_bottom_navbar_widget/widget/bottom_sheet_widget.dart';
import 'package:dressing_app/view/widget/web_view_widget/web_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AccountBottomNavBarWidgetController extends GetxController {
  void onTermsOfUseTap();
  void onPrivacyPolicyTap();
  void goBack();
  void onLogoutClick();
  void onChngeThemesClick();
  void onChangeLangTap();
  void goToEditScreen();
}

class AccountBottomNavBarWidgetControllerIMP extends AccountBottomNavBarWidgetController {
  MyServices myServices = Get.find();
  DataUser? dataUser;

  @override
  void onTermsOfUseTap() {
    Get.to(() => const WebViewScreen(appBarTitle: "Terms Of Use", url: ApiLink.termOfUse));
  }

  @override
  void onPrivacyPolicyTap() {
    Get.to(() => const WebViewScreen(appBarTitle: "Privacy Policy", url: ApiLink.privacyPolicy));
  }

  void logout() {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 2), () async {
      await myServices.sharedPreferences.setBool('isLogin', false);
      Get.back();
      Get.offAllNamed(AppRouter.loginScreen);
    });
  }

  @override
  void onLogoutClick() {
    Get.bottomSheet(BottomSheetLogOutWidget(onConfirmTap: logout, onCancelTap: goBack));
  }

  @override
  void goBack() {
    Get.back();
  }

  @override
  void onChngeThemesClick() async {
    Get.bottomSheet(BottomSheetThemeWidget(
      onDarkMode: () {
        changeTheme('dark');
      },
      onLightMode: () {
        changeTheme('light');
      },
    ));
  }

  void changeTheme(String? value) async {
    if (value == 'dark') {
      Get.changeThemeMode(ThemeMode.dark);
      await myServices.sharedPreferences.setBool('theme', true);
      Get.back();
    } else {
      Get.changeThemeMode(ThemeMode.light);
      await myServices.sharedPreferences.setBool('theme', false);
      Get.back();
    }
  }

  @override
  void onChangeLangTap() {
    Get.snackbar('error'.tr, 'error1'.tr, snackPosition: SnackPosition.BOTTOM);
  }

  Future<DataUser?> getUserData() async {
    String? data = await myServices.sharedPreferences.getString('userdata');
    if (data == null || data.isEmpty) return null;
    return DataUser.fromJson(jsonDecode(data));
  }

  @override
  void goToEditScreen() {
    Loader().lottieLoader();
    Future.delayed(const Duration(seconds: 2), () {
      getUserData().then((value) {
        dataUser = value;
        Get.back();
        Get.toNamed(AppRouter.editProfileScreen, arguments: {'DataUser': dataUser});
      });
    });
  }
}
